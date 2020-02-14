# 명령어
## sh
* -v(verbose) 옵션
읽은대로 출력한다. 디버그시 유용하다.
```
cat << EOF > text.txt
echo "test1..."
echo "test2..."
echo "test3..."
echo "test4..."
echo "test5..."
EOF

cat test.txt | sh -v
echo "test1..."
test1...
echo "test2..."
test2...
echo "test3..."
test3...
echo "test4..."
test4...
echo "test5..."
test5...
```

# 참조사이트
* ShellScript 입문
- [シェルスクリプト入門 書き方のまとめ](http://motw.mods.jp/shellscript/tutorial.html)