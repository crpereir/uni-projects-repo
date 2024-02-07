

List_node *list_search(List_node *list, const void *data, int (*fcmp)(const void *, const void *)) {
    for (List_node *p = list; p != NULL; p = p->next)
        if (fcmp(p->data, data) == 0)
            return p;
    return NULL;
}


typedef struct list_node { 
    struct list_node *next; 
    void *data; 
} List_node;