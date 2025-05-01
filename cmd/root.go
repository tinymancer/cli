package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var version = "dev"

var rootCmd = &cobra.Command{
	Use:   "tinymancer",
	Short: "tinymancer CLI tool",
	Long:  "tinymancer is a CLI tool for managing environment configs.",
	Run: func(cmd *cobra.Command, args []string) {
		if v, _ := cmd.Flags().GetBool("version"); v {
			fmt.Printf("tinymancer %s\n", version)
			return
		}
		fmt.Println("tinymancer is alive ⚡")
	},
}

func init() {
	rootCmd.Flags().BoolP("version", "v", false, "Print version")
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
