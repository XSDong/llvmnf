#include <stdlib.h>
#include <stdio.h>
#include "ac.h"


struct Node* root = NULL;
char* target_str;
void  link_suffix();
void create_str(const char * v);
void print_tree();
void initial_queue(queue_node* *p_head, queue_node* *p_tail);
void queue_push(queue_node* *head, queue_node* *tail,Node* new_pnd);
Node* queue_pop(queue_node* *head, queue_node* *tail);

static Node* search_son(Node* pnd, char ch) {
	if (pnd->sons == NULL)return NULL;
	Node* target_son = pnd->sons;
	while (target_son->c != ch && target_son->brother != NULL) {
		target_son = target_son->brother;
	}
	if (target_son->c == ch) {
		return target_son;
	}
	else {
		return NULL;
	}
}

Node* malloc_and_initial_node(char c) {
	Node* pnd = (Node*)malloc(sizeof(Node));
	pnd->c = c;
	pnd->inDict = 0;
	pnd->parent = NULL;
	pnd->suffix = NULL;
	pnd->dictSuffix = NULL;
	pnd->sons = NULL;
	pnd->brother = NULL;
	return pnd;
}



void create_str(const char * v) {
	if (root == NULL) {
		root = malloc_and_initial_node(' ');
	}
	Node* cur_node = root;
	int i = 0;
	while (v[i] != '\0'){
		char cur_ch = v[i];
		if (cur_node->sons == NULL) {
			//printf("new son:%c\n", cur_ch);
			Node* new_son = malloc_and_initial_node(cur_ch);
			new_son->parent = cur_node;
			if (v[i+1] == '\0')new_son->inDict = 1;
			cur_node->sons = new_son;
			cur_node = new_son;
		}
		else {
			Node* target_son = cur_node->sons;
			while (target_son->c != cur_ch && target_son->brother != NULL) {
				target_son = target_son->brother;
			}
			if (target_son->c == cur_ch) {
				//printf("have son:%c\n", cur_ch);
				cur_node = target_son;
			}
			else {
				//printf("add son:%c\n", cur_ch);
				target_son->brother = malloc_and_initial_node(cur_ch);
				if (v[i + 1] == '\0')target_son->brother->inDict = 1;
				target_son->brother->parent = cur_node;
				cur_node = target_son->brother;
			}
		}
		i++;
	}
}




void initial_queue(queue_node* *p_head, queue_node* *p_tail) {
	
	*p_head = NULL;
	*p_tail = NULL;
}

void queue_push(queue_node* *head, queue_node* *tail,Node* new_pnd) {
	if ((*tail) == NULL) {
		*head = (queue_node*)malloc(sizeof(queue_node));		
		*tail = *head;
		(*tail)->next = NULL;
	}
	else {
		(*tail)->next = (queue_node*)malloc(sizeof(queue_node));
		*tail = (*tail)->next;
		(*tail)->next = NULL;
	}
	(*tail)->pnd = new_pnd;
}

Node* queue_pop(queue_node* *head, queue_node* *tail) {
	if (*head == NULL) {
		return NULL;
	}
	Node* ret = (*head)->pnd;	
	if ((*head)->next == NULL) {
		free((*head));
		(*head) = (*tail) = NULL;
	}
	else {
		queue_node* temp = (*head);
		(*head) = (*head)->next;
		free(temp);
	}
	return ret;
}


void suffix_link(Node* n){
	if (root == n->parent){
		n->suffix = root;
	}
	else{
		Node* node = n->parent;
		while (root != node){
			Node* temp = search_son(node->suffix, n->c);
			if (NULL != temp){
				n->suffix = temp;
				return;
			}
			else node = node->suffix;
		}

		Node* temp = search_son(node, n->c);
		if (NULL != temp){
			n->suffix = temp;
		}
		else{
			n->suffix = root;
		}
	}
}


void suffix_link_all() {
	queue_node* head;
	queue_node* tail;
	initial_queue(&head,&tail);

	Node* temp = root->sons;

	while (temp != NULL) {
		queue_push(&head,&tail,temp);
		temp = temp->brother;
	}
	
	Node* cur = queue_pop(&head, &tail);
	while (cur != NULL) {
		suffix_link(cur);
//printf("after temp queue\n");
		//printf("%c:%c\n",cur->c,cur->suffix->c);
		Node* temp = cur->sons;
		while (temp != NULL) {
			queue_push(&head, &tail, temp);
			temp = temp->brother;
		}
		cur = queue_pop(&head, &tail);
//printf("after while queue\n");
	}
	
}

Node* dict_suffix_link(Node* n)
{
	/*
	By WikiPedia:
	The green arcs can be computed in linear time by repeatedly traversing blue arcs
	until a filled in node is found, and memoizing this information.

	dict_suffix_link is the green arc.
	*/
	Node* temp = n;

	while (root != temp)
	{
		temp = temp->suffix;
		if (temp->inDict)
		{
			n->dictSuffix = temp;
			return temp;
		}
	}

	n->dictSuffix = root;
	return root;
}


void dict_suffix_link_all() {
	queue_node* head;
	queue_node* tail;
	initial_queue(&head, &tail);

	Node* temp = root->sons;
	while (temp != NULL) {
		queue_push(&head, &tail, temp);
		temp = temp->brother;
	}

	Node* cur = queue_pop(&head, &tail);
	while (cur != NULL) {
		dict_suffix_link(cur);
		Node* temp = cur->sons;
		while (temp != NULL) {
			queue_push(&head, &tail, temp);
			temp = temp->brother;
		}
		cur = queue_pop(&head, &tail);
	}
}


void  link_suffix()
{
	suffix_link_all();

	dict_suffix_link_all();
	//return root;
}



void load_rules(const char* filename) {
	//char filename[] = "hosts"; //ÎÄ¼þÃû
	FILE *fp;
	char StrLine[1024];             //Ã¿ÐÐ×î´ó¶ÁÈ¡µÄ×Ö·ûÊý
	if ((fp = fopen(filename, "r")) == NULL) //ÅÐ¶ÏÎÄ¼þÊÇ·ñ´æÔÚ¼°¿É¶Á
	{
		printf("error!");
	}
	while (!feof(fp))
	{
		fgets(StrLine, 1024, fp);  //¶ÁÈ¡Ò»ÐÐ
		if (StrLine[0] >= '0' && StrLine[0] <= '9') {
			char temp[1600];
			int i = 0;
			while ((StrLine[i] >= '0' && StrLine[i] <= '9') || StrLine[i] == '.') {
				temp[i] = StrLine[i];
				i++;
			}
			temp[i] = '\0';
			create_str(temp);
			//printf("%s\n", temp); //Êä³ö
		}
		else {
			continue;
		}
	}
	fclose(fp);                     //¹Ø±ÕÎÄ¼þ
}

void ac_initial() {
	root = NULL;
	target_str = (char*)malloc(1501);
	int value = 1;
	for(int i=0;i<1500;i++){
		target_str[i] = value;
		if(value == 255)value = 1;
		else value += 1;
		//value = (value + 1)%255;
	}
	target_str[1500] = '\0';
	load_rules("hosts");

	link_suffix();

}

