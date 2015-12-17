#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define N 25333
#define dict_length 4096

void read_sequence(int image[N])
{
    FILE *infile;
    int i,t;
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

void create_dictionary(char *dictionary[], int *last_word){
    char tmp[] = "\0";
    tmp[0] = 32;
    dictionary[0] = tmp;
    for (int i = 1; i < 126-31; i++)
    {
        tmp[0] = tmp[0] + 1;
        dictionary[i] = tmp;
        *last_word = i;
    }
}

bool check_word(char *dictionary[], char word_to_find[], int *last_word){
    for (int i = 0; i < *last_word + 1; i++)
    {
        if (dictionary[i] == word_to_find)
        {
            return true;
            break;
        }
        else
            return false;
    }
}

int p_position(char *dictionary[], char word_to_search[], int *last_word)
{
for (int i = 0; i < *last_word + 1; i++)
{
    if (word_to_search==dictionary[i])
    {
        return i;
        break;
    }
}

}

void add_word(char *dictionary[], char word_to_add[], int *last_word)
{
    dictionary[*last_word+1] = word_to_add;
    *last_word = *last_word + 1;
}

int main()
{
    char P[] = "\0";
    char C[] = "\0";
    int last_word = 0;
    bool exists = false;

    static int image[N];
    static int image_output[N];
    static char *dictionary[dict_length];
    read_sequence(image);
    create_dictionary(dictionary, &last_word);
    // printf("%c",*dictionary[5]);
    //add_word(dictionary, "absds", &last_word);
    int count = 0;
    for (int i = 0; i < N; i++)
    {
        C[0] = image[i];
        strcat(P, C);
        exists = check_word(dictionary, P, &last_word);
        if (!exists)
        {
            add_word(dictionary, P, &last_word);
            image_output[count] = p_position(dictionary, P, &last_word);
            count = count + 1;
            printf("%d \n", count);
            strcpy(P, C);
        }
    }
    char a = 'a';
    char b = 'b';
    char sum = 49;
    // for (int i=0; i<150; i++)
    // {
    //     printf("%d\n",image_output[i]);
    //     printf("%s\n",dictionary[i]);
    // }
    // printf("%d\n", last_word);
    // add_word(dictionary, "abc", &last_word);
    // printf("%d\n", last_word);

    //C[0] = image[2];
    //strcpy(C, P);
    //printf("%s", C);

    //printf("%c",*P);
}
//;;;;9;$<>=>??=>>>>>>>>>??>>>>>@??;

//59595959575936606261626363616262626262626262626363626262626264636359
//139189176177175174175176170163168173171169166157152158163158154163165163159155155154155160161161163169169168167167166168168167167167168
