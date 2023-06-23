#include <bits/stdc++.h>
#include<iostream>
using namespace std;

int main()
{
    int processNum, resourceNum;

    freopen("input.txt", "r", stdin);
    cout << "Enter processNum & Resource num: " ;
    cin >> processNum >> resourceNum;
    int allocation[processNum][resourceNum], max[processNum][resourceNum], available[resourceNum], need[processNum][resourceNum], status[processNum], process[processNum];
    int index = 0;
    
    for(int i=0; i<processNum; i++){
        for(int j=0; j<resourceNum; j++){
            cin >> allocation[i][j];
            //cout << allocation[i][j]<< endl;
        }
    }
    for(int i=0; i<processNum; i++){
        for(int j=0; j<resourceNum; j++){
            cin >> max[i][j];
            //cout << max[i][j]<< endl;
        }
    }

    for(int i=0; i<resourceNum; i++){
        cin >> available[i];
    }

    for(int i = 0; i<processNum; i++){
        status[i] = 0;
    }

    for(int i = 0; i<processNum; i++){
        for(int j = 0; j<resourceNum; j++){
            need[i][j] = max[i][j] - allocation[i][j];
            //cout << need[i][j] << endl;
        }
    }

    int y = 0;
    for(int k = 0; k<processNum; k++){
        for(int i=0; i<processNum; i++){
            if(status[i] == 0){
                int flag = 0;
                for(int j = 0; j<resourceNum; j++){
                    if(need[i][j] > available[j]){
                        flag = 1;
                        break;
                    }
                }

                if(flag == 0){
                    process[index++] = i;
                    for(y = 0; y<resourceNum; y++){
                        available[y] = available[y] + allocation[i][y];
                        //cout<<available[y]<<endl;
                    }
                    status[i] = 1;
                }
            }
        }
    }

    // for (int i=0; i<processNum; i++){
    //     cout << status[i] << endl;
    // }
    int flag = 1;
    for(int i = 0; i<processNum; i++){
        cout << "status: " << status[i]<<endl;
        if(status[i] == 0){
            flag = 0;
            cout << "No safe sequence found!"<< endl;
            break;
        }
    }

    if(flag == 1){
        cout << "Safe Sequence found!" <<endl;
        cout << "SAFE SEQUENCE: ";
        for(int i = 0; i< processNum-1; i++){
            cout<< " P-" << process[i]+1 << " >";
        }
        cout << " P-" << process[processNum-1]+1 << endl;
    }
    return 0;
}