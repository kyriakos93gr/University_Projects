#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define N 25333
#define dict_length 4096
#define max_str_len 40

int i;

void read_sequence(int image[N])
{
    FILE *infile;
    i;
    if((infile=fopen("akiyo0.y","rb"))==NULL)
    {
        printf("Image doesn't exist\n");
        exit(-1);
    }
    for(i=0;i<N;i++)
    {
        image[i]=(int)fgetc(infile);
    }
    fclose(infile);
}

void create_dictionary(char dictionary[dict_length][max_str_len], int *last_word){
    char tmp[] = "a";
    tmp[0] = 32;
    printf("%s", tmp);
    printf("%s", dictionary[3]);
    for (i = 0; i < 126-30; i++)
    {
        strcpy(dictionary[i], tmp);
        tmp[0] = tmp[0] + 1;
        *last_word = i-1;
    }
}
int check_word(char dictionary[dict_length][max_str_len], char word_to_find[], int *last_word){
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
    char P[] = "\0";
    char C[] = "\0";
    int last[10000] = {0};
    int last_word = 0;  //Points to last dictionary word
    int exists = 1;
    static int image[N];
    static int image_output[N];
    static char dictionary[dict_length][max_str_len];

    read_sequence(image);
    create_dictionary(dictionary, &last_word);
    int count = 0;
    for (i = 0; i < N; i++)
    {
        C[0] = image[i];
        strcat(P, C);
        exists = check_word(dictionary, P, &last_word);
        if (exists == 0 && last_word < 4096 - 1)
        {
            add_word(dictionary, P, &last_word);
            image_output[count] = p_position(dictionary, P, &last_word);
            count = count + 1;
            strcpy(P, C);
            last[count] = last_word;
        }
        else if (exists == 1 && last_word > 4096 -1)
        {
            image_output[count] = p_position(dictionary, P, &last_word);
            count = count + 1;
        }
    }
    // for (i = 0; i < sizeof(dictionary)/sizeof(dictionary[0]); i++)
    // {
    //     printf("%s  %d  \n", dictionary[i], i );
    // }
    //system("Pause");
}
