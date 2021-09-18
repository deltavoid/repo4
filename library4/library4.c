#include <repo3/library3/public/library3.h>
#include <repo4/library4/public/library4.h>
// #include <repo1/library1/public/library1.h>

#include <stdio.h>




void repo4_library4_display()
{
    printf("repo4_library4_display: 1\n");

    repo3_library3_display();

    printf("repo4_library4_display: 2\n");
}