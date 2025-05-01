package cmd

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/spf13/cobra"
)

var uninstallCmd = &cobra.Command{
	Use:   "uninstall",
	Short: "Uninstall tinymancer from the system",
	Run: func(cmd *cobra.Command, args []string) {
		binaryPath, err := exec.LookPath("tinymancer")
		if err != nil {
			fmt.Println("tinymancer is not installed or already removed.")
			return
		}

		fmt.Printf("[⚠️] Removing binary at %s...\n", binaryPath)

		err = os.Remove(binaryPath)
		if err != nil {
			fmt.Println("[!] Retrying with sudo...")
			removeCmd := exec.Command("sudo", "rm", binaryPath)
			removeCmd.Stdin = os.Stdin
			removeCmd.Stdout = os.Stdout
			removeCmd.Stderr = os.Stderr

			if err := removeCmd.Run(); err != nil {
				fmt.Printf("[✖] Failed to remove binary: %v\n", err)
				os.Exit(1)
			}
		}

		fmt.Println("[✅] tinymancer has been uninstalled successfully.")
	},
}

func init() {
	rootCmd.AddCommand(uninstallCmd)
}
