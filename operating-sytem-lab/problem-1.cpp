#include<iostream>
#include<fstream>
#include<windows.h>
#include<unistd.h>
#include<dirent.h>

using namespace std;

int main(int argc, char* argv[])
{
    string action = argv[1];

    if(action == "create"){
        string fileName = argv[2];
        cout << fileName << endl;
        ofstream MyFile(fileName.c_str());
        MyFile << "lab exam";
        cout << "File created !" << endl;
        MyFile.close();
    }
    else if(action == "delete"){
        string fileName = argv[2];
        int response = remove(fileName.c_str());
        if(!response){
            cout << "Delete file !!" << endl;
        }
        else {
            cout << "Error occured !!" << endl;
        }
    }
    else if(action == "copy"){
        string oldDir = argv[2];
        string newDir = argv[3];
        int response = CopyFile(oldDir.c_str(),newDir.c_str(),true);
        if(response){
            cout << "Copy file successfull!" << endl;
        }
        else {
            cout << "Error occured !!" << endl;
        }
    }
    else if(action == "move"){
        string oldDir = argv[2];
        string newDir = argv[3];
        int response = MoveFile(oldDir.c_str(), newDir.c_str());
        //cout<<response<<endl;
        if(response){
            cout<<"File move successfull! ";
        }
        else {
            cout<<"Error occured";
        }
    }
    else{
        cout << "Wrong command!" << endl;
    }
    //cout << "hello" << action << endl;
    return 0;
}