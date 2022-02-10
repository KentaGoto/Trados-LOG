package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	exe, _ := os.Executable()    // 実行ファイルのフルパス
	rootDir := filepath.Dir(exe) // 実行ファイルのあるディレクトリ

	r := gin.Default()
	r.Static("/results", "./results") // 静的ディレクトリとしておかないとHTMLのダウンロードリンクからアクセスできない
	r.LoadHTMLGlob("html/**/*.tmpl")

	// アクセスされたらこれを表示
	r.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "html/index.tmpl", gin.H{
			"title": "Trados Log",
		})
	})

	// uploadされたらこれ
	r.POST("/", func(c *gin.Context) {
		xmlFile, err := c.FormFile("upload")
		if err != nil {
			c.String(http.StatusBadRequest, fmt.Sprintf("get form err: %s", err.Error()))
			return
		}
		log.Println(xmlFile.Filename)

		// 特定のディレクトリにファイルをアップロードする
		dst := rootDir + "\\uploaded" + "\\" + filepath.Base(xmlFile.Filename)
		log.Println(dst)
		if err := c.SaveUploadedFile(xmlFile, dst); err != nil {
			c.String(http.StatusBadRequest, fmt.Sprintf("upload file err: %s", err.Error()))
			return
		}

		// 時刻オブジェクト
		t := time.Now()
		const layout = "2006-01-02_15-04-05"
		tFormat := t.Format(layout)

		// 結果が記載されるhtmlのファイル名
		resultFile := tFormat + ".html"
		resultFile = "results\\" + resultFile

		// XSLTパーサーにかける
		_, err = exec.Command("msxsl.exe", dst, "Trados_LOG _2019_chara_word.xsl", "-o", resultFile).CombinedOutput()
		if err != nil {
			fmt.Println("Command Exec Error")
		}

		// Pythonで整形してエクセルに入力
		_, err = exec.Command("Trados-log-shaping.exe", resultFile, tFormat).CombinedOutput()
		if err != nil {
			fmt.Println("Command Exec Error")
		}

		// index.tmplを書き換えて、xlsxをダウンロードさせる
		c.HTML(http.StatusOK, "html/index.tmpl", gin.H{
			"title":           "Trados Log",
			"downloadMessage": "Download: ",
			"downloadfile":    tFormat + "_log.xlsx",
		})

	})

	r.Run(":10")
}
