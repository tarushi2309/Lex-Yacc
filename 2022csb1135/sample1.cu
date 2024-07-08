int i = 4 + 5;

/* Comment Here
    This is a sample test case */

char *func(int a, char *b)
{
    int i = 2+3;
    char *s;
    while(i >= 0)
    {
        s="a"+s;
        i=i-1;
    }
    return s;
}

int main()
{
    char *s="Hi";
    if(true)
    func(9,s);
    else
    {
        int num=s[0];
    }
    return 1;
}