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
    dictionary[0] = " ";
    for (int i = 1; i < 126-31; i++){
        dictionary[i] = dictionary[i-1] + 1;
        printf("%c ", dictionary[i]);
        *last_word = i;
    }
}

bool check_word(char *dictionary[], char word_to_find[]){
    char tmp[] = "\0";
    for (int i = 0; i < dict_length; i++)
    {
        tmp[0] = *dictionary[i];
        if (strcmp(tmp, word_to_find)){
            return true;
            break;
        }
        else
            return false;
    }
}

// void add_word(char dictionary[], char word_to_add[])
// {
//     dictionary[i+1] = word_to_add[];
// }

int main()
{
    char P[] = "\0";
    char C[] = "\0";
    int last_word = 0;
    bool exists = false;

    static int image_array[N];
    char *dictionary[dict_length];
    read_sequence(image_array);
    create_dictionary(dictionary, &last_word);
    printf("%d",dictionary[50]);
    for (int i = 0; i < N; i++)
    {
        C[0] = image_array[i];
        strcat(P, C);
        exists = check_word(dictionary, P);

    }
    char a = 'a';
    char b = 'b';
    char sum = 49;

    //C[0] = image_array[2];
    //strcpy(C, P);
    //printf("%s", C);

    //printf("%c",*P);
}
//;;;;9;$<>=>??=>>>>>>>>>??>>>>>@??;

//59595959575936606261626363616262626262626262626363626262626264636359
//139189176177175174175176170163168173171169166157152158163158154163165163159155155154155160161161163169169168167167166168168167167167168
