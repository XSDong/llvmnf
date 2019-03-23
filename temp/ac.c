#include <stdlib.h>
#include <stdio.h>
#include "../ac.h"


extern struct Node* root;
void match_string(const char* s);
extern char* target_str;

Node* search_son(Node* pnd, char ch) {
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

void add_matched_string(Node* n)
{

	/*Node* result = n;
	string str;
	while (root != result)
	{
		str += result->c;
		result = result->parent;
	}
	reverse(str.begin(), str.end());
	matchedWords.push_back(str);*/
	char str[2000];
	Node* result = n;
	int len = 0;
	while (root != result)
	{
		str[len++] = result->c;
		result = result->parent;
	}
	char result_str[2000];
	for (int i = 0; i <len; i++) {
		result_str[i] = str[len - 1 - i];
	}
	result_str[len] = '\0';
	//printf("%s\n",result_str);
}


void match_string(const char* s)
{
	Node* state = root;//Current state.
	Node* node = root;

	unsigned int i = 0;
	while(s[i] != '\0'){
		node = state;

		/*
		By WikiPedia:
		At each step, the current node is extended by finding its child,
		and if that doesn't exist, finding its suffix's child,
		and if that doesn't work, finding its suffix's suffix's child, and so on,
		finally ending in the root node if nothing's seen before.
		*/
		while (NULL == search_son(node, s[i]) && root != node)
			node = node->suffix;

		//Now, in chich condition preivious while loop exits?
		if (root == node)//At root.
		{
			node = search_son(node, s[i]);
			if (NULL == node)
				node = root;
		}
		else
			node = search_son(node, s[i]);//Find the right child.

							
		Node* temp = node;
		//while (root != temp)//Replace ********
		while (NULL != temp->dictSuffix)//********
		{
			if (temp->inDict)//The word starts from root, ends at temp.
				add_matched_string(temp);

			//temp = temp->suffix;//Replace ********
			temp = temp->dictSuffix;//********
		}

		//********
		if (temp->inDict)
			add_matched_string(temp);

		state = node;

		i++;
	}

}


/*void print_tree() {
	queue_node* head;
	queue_node* tail;
	initial_queue(&head, &tail);

	Node* temp = root->sons;
	while (temp != NULL) {
		
		queue_push(&head, &tail, temp);
		//printf("%c:%d\n", temp->c, temp->inDict);
		temp = temp->brother;
	}

	Node* cur = queue_pop(&head, &tail);
	//printf("%c:%d\n", cur->c, cur->inDict);
	while (cur != NULL) {
		//suffix_link(cur);
		printf("%c:%c:%d\n", cur->c, cur->suffix->c,cur->inDict);
		Node* temp = cur->sons;
		while (temp != NULL) {
			//printf("%c:%d\n", temp->c, temp->inDict);
			queue_push(&head, &tail, temp);
			temp = temp->brother;
		}
		cur = queue_pop(&head, &tail);
	}
}*/






void ac_match() {

	//print_tree();
	match_string(target_str);
	//match_string("173.194.55.7574.125.157.77173.194.49.188");
}
