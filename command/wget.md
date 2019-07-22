# wget

## Wget 옵션
|옵션|설명|
|:--|:--|
|-V, --version|Wget 버전표시|
|-h, --help|도움말 표시|
|-q, --quiet|전척상황등을 표시 하지 않음|
|-O file, --output-document=file|file로 저장|
|-c, --continue|이전부터 계속해서 파일다운로드를 재개시 함|
|-r, --recursive|링크마다 들어가서 재귀적으로 다운로드 함|
|-l depth, --level=depth|재귀적으로 다운로드 할 때 링크의 뎁스를 제한함 |
|-w seconds, --wait=seconds|재귀적으로 다운로드 할 때 다운로드의 sleep 타입을 부여함|
|-np, --no-parent|재귀적으로 다운로드 할 때 부모 디렉토리는 크롤링 하지 않음|
|-I list, --include list|재귀적으로 다운로드 할 때 list에 포함된 디렉토리만 대상으로 함|
|-N, --timestamping|파일이 갱신되었을 때 다운로드함|
|-m, --mirror|미러링용 옵션을 유효화 함 -r -N -l inf --no-remove-listing과 같다. --no-remove-listing은 FTP만 가능한 listing파일을 삭제하지 않기 위한 옵션|

## 사이트 전체 크롤링
```shell
wget -r --no-parent -w 1 -l 1 --restrict-file-names=nocontrol https://gihyo.jp/dp/
```