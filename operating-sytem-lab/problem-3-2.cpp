#include<bits/stdc++.h>
#include<iostream>
using namespace std;

queue<int> q;
int sizeOfFrame = 4;
int pageFault = 0;
int queueLength = 0;

bool FIFO(int n)
{
    queue<int> targetQueue;
    targetQueue = q;
    while(!targetQueue.empty()){
        int top = targetQueue.front();
        targetQueue.pop();
        if(top == n){
            return true;
        }
    }

    if(queueLength == sizeOfFrame){
        q.pop();
        q.push(n);
    }
    
    else{
        q.push(n);
        queueLength++;
    }
    pageFault++;
    return false;
}

int main()
{
    int count=0;
    while(1){
        int n;

        cin >> n;
        if(n < 0) break;

        count++;

        if(FIFO(n)){
            cout << "Page hit" << endl;
        }
        else {
            cout << "Page fault" << endl;
        }

        cout << "Queue: ";
        queue<int>currentQ;
        currentQ = q;
        while(!currentQ.empty()){
            int x = currentQ.front();
            currentQ.pop();
            cout << x << " ";
        }

        cout << endl;

        cout << "Total page fault: " << pageFault << endl;
        cout << "Total page hit : " << count - pageFault << endl;
        
        
    }
    return 0;
}
