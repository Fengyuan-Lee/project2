function checkPrimeNumber(int n，k);
int main()
{
    int n, k, i, flag;
    int j, flag = 1;
    input("Please enter two positive integers: ",'n','k');
   
      for(j=2; j <= n/2; ++j)
    {
        if (n%j == 0)
        {
            flag =0;
            output("0(false)");
        }
    }
    for(i=n1+1; i<n2; ++i)
    {
        flag = checkPrimeNumber(i);
 
        if(flag == 1)
             output("1(true)");
        break;
    }
    return 0;
}