package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "tinymancer",
	Short: "tinymancer CLI tool",
	Long:  "tinymancer is a CLI tool for managing environment configs.",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("tinymancer is alive ⚡")
	},
}

// Execute initializes the root command
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
