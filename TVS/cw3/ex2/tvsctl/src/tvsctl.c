
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <grp.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/types.h>
#include <sys/wait.h>
#define BUFFER_SIZE 1024

char *request_socket = "/run/isel/tvsctld/request";
char *cmds[] = {"start", "stop", "reset", "inc", "dec", "status", "enejinques", "stor"};

int is_valid_action(char *input) {
	for (int i = 0; i < 6; i++) {
		if (strcmp(input, cmds[i]) == 0)
			return 0;
	}
	return 1;
}

int is_number(char *input) {
	for (int i = 0; i < strlen(input); i++) {
		if (input[i] < '0' || input[i] > '9')
			return 1;
	}
	return 0;
}

void extra(char *input) {
	if (strcmp(input, "enejinques") == 0) {
		fprintf(stderr, "ENGINE-X!!!\n");
		exit(1);
	}
	if (strcmp(input, "stor") == 0) {
		fprintf(stderr, "ENGINHEIRO!!!\n");
		exit(1);
	}
}

void build_cmd(char *buffer, int n_args, char *args[]) {
	extra(args[1]);
	strcat(buffer, args[1]);
	if (strcmp(args[1], "stop") == 0) {
		if (n_args == 3) {
			if (strcmp(args[2], "-db") != 0) {
				fprintf(stderr, "Invalid parameter.\n");
				exit(1);
			}
			strcat(buffer, " ");
			strcat(buffer, "-db");
			return;
		}
		else if (n_args > 2) {
			fprintf(stderr, "Too many args for command stop.\n");
			exit(1);
		}
	}
	
	if (strcmp(args[1], "inc") == 0 || strcmp(args[1], "dec") == 0 || strcmp(args[1], "reset") == 0) {
		if (n_args == 3 || n_args == 4) {
			if (is_number(args[2]) != 0) {
				fprintf(stderr, "Parameter must be a positive integer.\n");
				exit(1);
			}
			strcat(buffer, " ");
			strcat(buffer, args[2]);
			if (n_args == 4) {
				if (strcmp(args[1], "reset") == 0) {
					if (is_number(args[3]) != 0) {
						fprintf(stderr, "Parameter must be a positive integer.\n");
						exit(1);
					}
					strcat(buffer, " ");
					strcat(buffer, args[3]);
				}
				else {
					fprintf(stderr, "Too many args for command %s.\n", args[1]);
					exit(1);
				}
			}
		}
		else if (n_args > 4) {
			fprintf(stderr, "Too many args for command %s.\n", args[1]);
			exit(1);
		}
	}
}

void send_cmd(char *cmd) {

	puts("Connecting...");
	
	int conn_fd = socket(AF_UNIX, SOCK_STREAM, 0);
	if (conn_fd < 0) {
		fprintf(stderr, "ERROR creating socket\n");
		exit(EXIT_FAILURE);
	}

	struct sockaddr_un srv_addr;
	memset(&srv_addr, 0, sizeof(srv_addr));
	srv_addr.sun_family = AF_UNIX;
	
	if (strlen(request_socket) > 108) {
		fprintf(stderr, "Internal error: Socket location length higher than 108.");
		close(conn_fd);
		exit(1);
	}
	
	strcpy(srv_addr.sun_path, request_socket);

	if (connect(conn_fd, (struct sockaddr *)&srv_addr, sizeof (srv_addr)) < 0) {
		fprintf(stderr, "ERROR connecting socket\n");
		close(conn_fd);
		exit(EXIT_FAILURE);
	} 
	
	puts("Sending...");

	if (write(conn_fd, cmd, strlen(cmd) + 1) < 0) {
		fprintf(stderr, "ERROR writing to socket\n");
		close(conn_fd);
		exit(EXIT_FAILURE);
	}
	
	puts("Sent!");
	
	// Waiting for server reply.
	char len[BUFFER_SIZE];
	size_t n = read(conn_fd, len, BUFFER_SIZE);
	len[n] = '\0';
	
	puts("Completed.\n");
	printf("%s\n", len);

	close(conn_fd);
}

void main(int argc, char *argv[]) {
	
	// Check number of arguments.
	if (argc < 2) {
		fprintf(stderr, "Input a command.\n");
		exit(EXIT_FAILURE);
	} else if (argc > 4) {
		fprintf(stderr, "Too many args.\n");
		exit(EXIT_FAILURE);
	}
	
	// Store command checked to send over socket.
	char cmd[100] = "";
	
	// Check if requested action is valid.
	if (is_valid_action(argv[1]) != 0) {
		fprintf(stderr, "Action invalid.\n");
		exit(EXIT_FAILURE);
	}
	
	// Build command.
	build_cmd(cmd, argc, argv);
	
	// Send over socket.
	send_cmd(cmd);

	exit(EXIT_SUCCESS);
}
