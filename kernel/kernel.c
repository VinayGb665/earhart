/*


*/

#include <string.h>
void main_kernel(void){
    char *str = "All dommed in vain";
    char *vidptr = (char*)0xb8000;
    int len = strlen(str);
    int i,k=0;
    while(i<80*25*2){  // 25*80 with 2 bytes each 
        vidptr[i] = ' ';
        vidptr[i+1] = 0x07;
        i+=2
    }
    
    i=0;
    while(i<len*2){
        vidptr[k] = str[i];
        vidptr[k+1] = 0x07;
        k+=2;
        i+=1;
    }

    return ;
}