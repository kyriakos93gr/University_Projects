#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define N 25333
#define dict_length 4096
#define max_str_len 20

void read_sequence(int image[N])
{
    FILE *infile;
    int i;
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

// void create_dictionary(char dictionary[][], int *last_word){
//     char tmp[] = "\0";
//     tmp[0] = 32;
//     printf("%s", tmp[0]);
//     dictionary[0] = malloc(strlen(tmp) + 1);
//     strcpy(dictionary[0], tmp);
//     printf("%c", dictionary[0]);
//     free (dictionary[0]);
//     for (int i = 1; i < 126-31; i++)
//     {
//         tmp[0] = tmp[0] + 1;
//         //strcpy(dictionary[i], tmp);
//         printf("%c", dictionary[i]);
//         *last_word = i;
//     }
// }

void create_dictionary(char dictionary[dict_length][max_str_len], int *last_word){
    char tmp[] = "a";
    tmp[0] = 32;
    printf("%s", tmp);
    printf("%s", dictionary[3]);
    for (int i = 0; i < 126-30; i++)
    {
        strcpy(dictionary[i], tmp);
        tmp[0] = tmp[0] + 1;
        *last_word = i-1;
    }
}
bool check_word(char dictionary[dict_length][max_str_len], char word_to_find[], int *last_word){
    return false;
    for (int i = 0; i < *last_word; i++)
    {
        if (strcmp(dictionary[i], word_to_find) == true)
        {
            return true;
            break;
        }
    }

}

int p_position(char dictionary[dict_length][max_str_len], char word_to_search[], int *last_word)
{
    for (int i = 0; i < *last_word + 1; i++)
    {
        if (strcmp(dictionary[i], word_to_search) == true)
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
    //dictionary[*last_word+1] = word_to_add;
    *last_word = *last_word + 1;
}

int main()
{
    char P[] = "\0";
    char C[] = "\0";
    int last_word = 0;  //Points to last dictionary word
    bool exists = false;

    static int image[N];
    static int image_output[N];
    static char dictionary[dict_length][max_str_len];
    read_sequence(image);
    create_dictionary(dictionary, &last_word);
    //add_word(dictionary, "absds", &last_word);
    // for(int i = 0; i<150; i++)
    // {
    //     printf("\n Element is %s", dictionary[i]);
    // }
    int count = 0;
    for (int i = 0; i < N; i++)
    {
        C[0] = image[i];
        strcat(P, C);
        //printf("%d\n", i);
        //printf("%s\n", P);
        //printf("%s\n", C);
        exists = check_word(dictionary, P, &last_word);
        if (exists == false)
        {
            add_word(dictionary, P, &last_word);
            image_output[count] = p_position(dictionary, P, &last_word);
            count = count + 1;
            //printf("%d \n", count);
            strcpy(P, C);
        }
    }
}
//;;;;9;$<>=>??=>>>>>>>>>??>>>>>@??;

//59595959575936606261626363616262626262626262626363626262626264636359
//139189176177175174175176170163168173171169166157152158163158154163165163159155155154155160161161163169169168167167166168168167167167168
