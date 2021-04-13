# dk-hoonti06.gitlab.io-env
hoonti06.gitlab.io 배포를 위한 Docker 이미지 생성

## 설명
- Gitlab page를 배포하기 위해서는 Gitlab CI를 이용해야 한다
- [gitlab jekyll](https://gitlab.com/pages/jekyll)를 보면 Gitlab CI에서 Docker image를 사용하고, 그 이미지는 ruby이다.
	- Custom Docker 이미지를 통해 배포 환경을 변경할 수 있다는 의미

## 설치 프로그램
- nodejs & yamljs
	- tag map 생성(generateData.js)
- [ditaa](http://ditaa.sourceforge.net)
	- ascii character로 그린 diagram(사각형, 선 등)을 bitmap graphics(.png)로 convert 해준다
	- ditaa를 활용한 문서 작성

