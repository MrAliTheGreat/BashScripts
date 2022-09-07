package main

import (
	"fmt"
	"os/exec"
	"strings"
)

func main() {
	c := make(chan string)

	lsCommand := exec.Command("ls", "*.rar")
	stdout, err := lsCommand.Output()

	if err != nil {
		fmt.Println(err)
		return
	}

	rarFileNames := strings.Split(string(stdout), "\n")

	for _, rarFileName := range rarFileNames {
		if rarFileName != "" {
			go unrar(rarFileName, c)
		}
	}

	for i := 0; i < len(rarFileNames)-1; i++ {
		fmt.Println(<-c)
	}
	close(c)
}

func unrar(fileName string, c chan string) {
	app := ""
	rarPath := "" + fileName
	rarPassword := ""

	unrarCommand := exec.Command(
		app,
		"-p"+rarPassword,
		"-x*.jpg",
		"-x*.txt",
		"-x*.url",
		"e", rarPath,
	)

	err := unrarCommand.Run()

	if err != nil {
		c <- "Error while using unrar!"
		return
	}

	c <- fileName + " Finished Successfully!!!"
}
