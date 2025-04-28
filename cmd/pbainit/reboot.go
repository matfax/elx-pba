//go:build !kexec
// +build !kexec

package main

var BootBinary = []string{"/bbin/shutdown", "reboot"}
