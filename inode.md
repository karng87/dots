# inode (Index Node struct)
```c
    struct ext4_inode{
        __le16 i_mode;
        __le16 i_uid;
        __le32 i_size_lo
            ...
    };
```

## block chain
    chained pointer
        can not change file size
## index block
    index block table

## FAT (file allocation table)
