# refind
## sudo pacman -S refind
```bash
refind-install
```
> ### This will attempt to find and mount your ESP, copy rEFInd files to esp/EFI/refind/, and use efibootmgr to make rEFInd the default EFI boot application.
```bash
# if use virtualbox
refind-install --usedefault /dev/sda1

refind-install --alldrivers
```
> 이 작업은 refind 를 EFI 파티션에 설치해주는데, 
> 원래 refind 설치 위치는 /boot/efi/EFI/refind 이다. (아마도..) 
>> 그런데 --usedefault 를 사용하면, 
>> /boot/efi/EFI/BOOT 에 bootx64.efi 라는 이름으로 설치가 된다. 
>>> VBox EFI 에선 이 위치에 있는 것만 인식을 하기에, 이런 방법을 택해야만 한다.


