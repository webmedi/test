#!/bin/bash
cd ~
mkdir tempo
cd tempo
wget https://github.com/termNinja/vim-vstudio-theme/archive/master.zip
unzip master.zip
cd vim-vstudio-theme-master/
cp -vi --preserve=all ./vstudioDark.vim /usr/share/vim/vim*/colors/
cd ~
rm -vrf ./tempo
#################################################################################
# .vimrc 設定用 標準出力にて自動生成
# ホームディレクトリに作成される
# . ( ドット ) 隠しファイルなので, ls -a ~ で見ること
echo -n  '" タブ幅をスペース 4 つ分にする
set tabstop=4
" タブを半角スペースで挿入する
set expandtab
" vim が自動で生成する ( 読み込み時など ) スペース 4 つ分にする
set shiftwidth=4
" 改行時などに自動インデントを行うようにする
set smartindent
" 空白文字の可視化
set list
"可視化した空白文字の詳細な表示設定
set listchars=eol:↓,tab:>\ ,extends:<
" 0 で始まる数値を, 8 進数として扱わないようにする
set nrformats-=octal
" ------------------------------------------------------------------------------
" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    " 構文ごとに文字色を変化させる
    syntax on

    " PODバグ対策
    syn sync fromstart

    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction

    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
"-------------------------------------------------------------------------------
" colorscheme 項目は, autocmd こうもくより下側に記述されていなければならない
" エラーがでてしまう
colorscheme vstudioDark' > ~/.vimrc
#################################################################################
