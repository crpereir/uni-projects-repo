#include <systemd/sd-daemon.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/wait.h>

#include <pthread.h>

#define BUFSIZE 1024

#define TVSAPP_BIN "/opt/isel/tvs/tvsapp/bin/"
#define SCRIPT_PREFIX "tvsapp-"
#define SCRIPT_EXTENSION ".sh"

void terror(char *msg) {
	perror(msg);
	pthread_exit((void *)(intptr_t)1);
}

void error(char *msg) {
	perror(msg);
	exit(1);
}

// Utility function to check if the requested action is valid.
int is_valid_action(char *action_name) {
    char *valid_actions[] = {"reset", "start", "stop", "dec", "inc", "status"};
    int number_of_actions = sizeof(valid_actions) / sizeof(valid_actions[0]);
    
    for (size_t i = 0; i < number_of_actions; i++) {
        if (strcmp(action_name, valid_actions[i]) == 0) {
            return 0;
        }
    }
    
    return 1;
}

// Utility function to check if the input only has numbers.
int is_number(char *input) {
	for (int i = 0; i < strlen(input); i++) {
		if (input[i] < '0' || input[i] > '9')
			return 1;
	}
	return 0;
}

// Utility function to validate each arg.
int is_arg_valid(const char *action, char *arg, int position) {
    
    switch(position) {
		case 1:
			if (strcmp(action, "stop") == 0) {
				return strcmp(arg, "-db");
			} else if (strcmp(action, "inc") == 0 || strcmp(action, "dec") == 0 || strcmp(action, "reset") == 0) {
				return is_number(arg);
			} else {
				return 1;
			}
    
		case 2:
			if (strcmp(action, "reset") == 0) {
				return is_number(arg);
			} else {
				return 1;
			}
		
		default: return 1;
	}
}

// Utility function used to count spaces to indirectly count number of words.
int counter_space(char *str) {
	int counter = 0;
	while (*str) {
		if (*str == ' ') counter++;
		str++;
	}
	return counter;
}

void execute_script(char *buf, const char *action_name) {
	
	// Store script [<script>.sh].
	size_t script_length = strlen(SCRIPT_PREFIX) + strlen(action_name) + strlen(SCRIPT_EXTENSION) + 1;
	char script[script_length];
	strcpy(script, SCRIPT_PREFIX);
	strcat(script, action_name);
	strcat(script, SCRIPT_EXTENSION);
		
	// Store file [<path>/<script>.sh].
	size_t file_length = strlen(TVSAPP_BIN) + strlen(script) + 1;
	char file[file_length];
	strcpy(file, TVSAPP_BIN);
	strcat(file, script);
	
	// Store args.
	char *args[counter_space(buf) + 2];
	args[0] = script;
	
	// Retrieving each argument and storing to cmd_with_args array.
	int counter = 1;
	char *arg = strtok(buf, " ");
	arg = strtok(NULL, " ");
	while (arg != NULL) {
		if (is_arg_valid(action_name, arg, counter) == 0) {
			args[counter++] = arg;
			arg = strtok(NULL, " ");
		} else {
			terror("invalid argument\n");
		}
	}
	
	// Must always finish with NULL.
	args[counter] = NULL;
	
	// Executing script in process.
	execvp(file, args);
		
	terror("error launching script!\n");
}

void * process_connection(void * ptr) {
	int conn_fd = (int)(intptr_t)ptr;

	char buf[BUFSIZE];
	int len;

	len = read(conn_fd, buf, BUFSIZE);
	if (len < 0) {
		terror("ERROR reading from socket.\n");
	}
	buf[len] = 0;
		
	// Store and check action name.
	char aux[strlen(buf)];
	strcpy(aux, buf);
	
	char *action_name = strtok(aux, " ");
	if (is_valid_action(action_name) != 0) {
		terror("invalid action\n");
	}
		
	pid_t pid = fork();
	if (pid == 0) {
		execute_script(buf, action_name);
	} else {
		int res = 0;
		waitpid(pid, &res, 0);
		
		if (WIFEXITED(res)) {
			if (WEXITSTATUS(res) == EXIT_SUCCESS) {
				printf("action %s executed successfully!\n", action_name);
			} else {
				printf("action %s not performed!\n", action_name);
			}
		} else {
			printf("action %s not performed!\n", action_name);
		}
	}

	close(conn_fd);
	return NULL;
}

int main(int argc, char * argv[]) {
	puts(":: START ::");

	int nfds = sd_listen_fds(0);
	if (nfds != 1) {
		error("Zero or more than one fds! Panic.\n");
	}

	int main_fd = SD_LISTEN_FDS_START;
	
	puts(":: LISTENING ::");
	
	for (;;) {

		struct sockaddr_un cli_addr;
		unsigned int cli_addr_len = sizeof cli_addr;

		int conn_fd = accept(main_fd, (struct sockaddr *)&cli_addr, &cli_addr_len);
		if (conn_fd < 0) {
			close(main_fd);
			error("ERROR on accept.\n");
		}
		
		pthread_t thread;
		pthread_create(&thread, NULL, process_connection, (void *)(intptr_t)conn_fd);
		pthread_detach(thread);
	}

	close(main_fd);

	puts(":: END ::");
	
	return 0;
}
