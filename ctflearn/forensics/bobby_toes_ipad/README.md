# Bobby Toe's Ipad - Forensics

![Title](images/title.png)

## Initial Thoughts

* strings shows "congrats you found me! you win an iPad!"
* using bless and saving jfif at the bottom unsuccessful so far

# Walkthrough

Zsteg confirms jpeg exists after the IEND in the png. Removing the congrats string and copying the hex starting from the JFIF header produces a new png

![IPAD](images/ipad.jpeg)

Spent a ton of time with steghide and stegsolve on the IPAD. Went back a used stegsolve on the original png and found:
```
zpv_tigqylhbafmeoesllpms
```

Put that in cyberchef with the phrase from the ipad jpeg using vigenere decode and out popped the flag



<details>
	<summary>Flag</summary>

you_thinkyougotskillshuh
</details>