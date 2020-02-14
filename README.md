# dk-hoonti06.gitlab.io-env

## Docker build를 진행할 때 아래와 같이 Warning 메시지가 떠도 잘 된다.

```bash
Step M/N : RUN npm install yamljs  
 ---> Running in 4d4280dd0036  
npm WARN saveError ENOENT: no such file or directory, open '/package.json'  
npm notice created a lockfile as package-lock.json. You should commit this file.  
npm WARN enoent ENOENT: no such file or directory, open '/package.json'  
npm WARN !invalid#1 No description  
npm WARN !invalid#1 No repository field.  
npm WARN !invalid#1 No README data  
npm WARN !invalid#1 No license field.  
```
