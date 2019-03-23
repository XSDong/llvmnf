#ifndef AC_H
#define AC_H

typedef struct Node
{
	char c;
	int inDict;
	struct Node* sons;
	struct Node* brother;
	struct Node* parent;
	struct Node* suffix;
	struct Node* dictSuffix;
}Node;

typedef struct queue_node {
	Node* pnd;
	struct queue_node* next;
}queue_node;





//Node* search_son(Node* pnd, char ch) ;

void ac_initial();
void ac_match();

#endif
