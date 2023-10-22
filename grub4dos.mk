grub4dos.7z:
	curl https://api.github.com/repos/chenall/grub4dos/releases/latest \
        | jq -r '.assets[] | select(.name | endswith(".7z")) | .browser_download_url' \
    	| xargs wget -O grub4dos.7z

grub4dos/$(ARCH)-efi/grub4dos.img: grub4dos.7z
	7zr x grub4dos.7z -ogrub4dos
	mv grub4dos/grub4dos-$(ARCH)-efi.img grub4dos/$(ARCH)-efi/grub4dos.img
