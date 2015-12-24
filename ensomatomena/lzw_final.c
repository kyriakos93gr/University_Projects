#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define N 144
#define M 176
#define dict_length 25000
#define max_str_len 40

void read_sequence(int image[N][M])
{
	int i, j;
    FILE *infile;
    if((infile=fopen("akiyo1.y","rb"))==NULL)
    {
        printf("Image doesn't exist\n");
        exit(-1);
    }
	for(i=0;i<N;i++)
	for(j=0;j<M;j++)
	{
		image[i][j]=(int)fgetc(infile);
		//printf("%d \n",image[i][j]);
	}
    fclose(infile);
}

void create_dictionary(char dictionary[dict_length][max_str_len], int *last_word){
	int i;
    char tmp[] = "a";
    tmp[0] = 32;
    printf("%s", tmp);
    printf("%s", dictionary[3]);
    for (i = 0; i < (126-30); i++)
    {
        strcpy(dictionary[i], tmp);
        tmp[0] = tmp[0] + 1;
        *last_word = i-1;
    }
}
int check_word(char dictionary[dict_length][max_str_len], char word_to_find[], int *last_word){
	int i;
    for (i = 0; i < *last_word; i++)
    {
        if (strcmp(dictionary[i], word_to_find) == 0)
        {
            return 1;
            break;
        }
    }
    return 0;
}

int p_position(char dictionary[dict_length][max_str_len], char word_to_search[], int *last_word)
{
	int i;
    for (i = 0; i < *last_word + 1; i++)
    {
        if (strcmp(dictionary[i], word_to_search) == 0)
        {
            return i;
            break;
        }
    }
    return 1;
}

void add_word(char dictionary[dict_length][max_str_len], char word_to_add[], int *last_word)
{
    strcpy(dictionary[*last_word+1], word_to_add);
    *last_word = *last_word +  1;
}

int main()
{
	int i, j;
	int tmp_N = N;
	int count = 0;
    char P[] = "\0";
    char C[] = "\0";
    int last[M*N+1] = {0};
    int last_word = 0;  //Points to last dictionary word
    int exists;
    int image[N][M];
    int image_output[M*N+1];
    static char dictionary[dict_length][max_str_len];

    read_sequence(image);
    create_dictionary(dictionary, &last_word);

    for (i = 0; i < N; i++)
    {
		for (j = 0; j < M; j++)
		{
	        C[0] = image[i][j];
	        strcat(P, C);
	        exists = check_word(dictionary, P, &last_word);
	        if (exists == 0)
	        {
	            add_word(dictionary, P, &last_word);
	            image_output[count] = p_position(dictionary, P, &last_word);
	            count = count + 1;
	            strcpy(P, C);
	            last[count] = last_word;
	        }
	        else
	        {
	            image_output[count] = p_position(dictionary, P, &last_word);
	            count = count + 1;
	        }
		}
    }
}
