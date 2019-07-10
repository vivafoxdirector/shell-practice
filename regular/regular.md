# Regular Expression

# grep 정규표현
```shell
grep -E '정규표현' source.txt

#정규표현 표기법

.                    개행문자를 제외한 임의의 1문자
*                    바로 앞의 1문자가 0개이상 반복하여 일치되는 문자(들). 직전의 문자는 정규표현이어도 된다.
^                    문자열의 맨앞
$                    문자열의 맨뒤
[ ]                  괄호내의 임의의 1문자와 일치. 하이픈(-)으로 범위 지정할 수 있음
[^ ]                 괄호내의 임의의 1문자와 불일치. 하이픈(-)으로 범위 지정할 수 있음
\+                   바로 앞의 문자 1개이상 반복하여 일치
\?                   바로 앞의 문자 0개 또는 1개와 일치
\{n\}                바로 앞의 문자 n개를 반복하여 일치
\{n,\}               바로 앞의 문자 n개 이상 반복하여 일치
\{,m\}               바로 앞의 문자 m개 이하 바복하여 일치
\{n,m\}              바로 앞의 문자 n개 이상, m개 이하 반복하여 일치
pattern1\|pattern2   pattern1 또는 pattern2 중 하나와 일치
\(pattern\)          pattern을 그룹화한다. 매칭된 내용은 \num으로 참조할 수 있다.
\                    정규표현으로 사용되는 특수문자를 일반적인 문자로 다룬다.

例
grep '\[0-9]' source.txt                           # '[0-9]'の文字列を検索
grep -E '(\[0-9]){2}' source.txt                   # '[0-9]'が2回続く文字列を検索
grep '[Ll]inux' source.txt                         # 「Linux」または「linux」が含む行を検索する
grep '\<[Ll]inux\>' source.txt                     #  独立した「Linux」または「linux」が含む行を検索する、RedhatLinuxとかは含まない
grep '[1-9][0-9][0-9][A-Z][0-9]' source.txt        # 先頭に0を含まず123A7のようなパターンに一致
grep '^[0-9]' source.txt                           # 数字を含まない行を検索する
grep '.....' source.txt                            # 5文字以上の行だけ探す
grep '\<W...s\>$' source.txt                       # 先頭がW、末尾がsの文字列を探す
grep '.' source.txt                                # 空行を除外
grep '^\<EX\>\{1,3\}' source.txt                   # EXという文字が1～3回出る行
grep '\<[A-Z]\{\6,15\}\>' source.txt               # 大文字アルファベットが6～15文字含む行
grep '\<[A-Za-z]\{\6,15\}\>' source.txt            # 大文字小文字アルファベットが6～15文字含む行
grep '\<[^0-9A-Za-z]\{\6,15\}\>' source.txt        # 大文字小文字アルファベットと数字以外の文字が6～15文字含む行
grep '[0-9]\{3\}-[0-9]\{3\}-[0-9]\{4\}' source.txt # 電話番号000-000-0000を含む行
```

# Refernce
* 내용: grepでこういう時はどうする?
    * 참조: https://qiita.com/hirohiro77/items/771ffb64dddceabf69a3
