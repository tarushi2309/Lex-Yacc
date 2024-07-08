int main()
{
    int num=45;
    while(num)
    {
        num=num-5;
    }
    return num & 1;  //error
    int s == num ; //error again but the parser stops at the first error
}