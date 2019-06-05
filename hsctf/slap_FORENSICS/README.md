# Slap (FORENSICS)

![title](images/title.png)

## Initial Thoughts

* exiftool shows gibberish Lorem ipsum
* strings shows a possible hidden file
* a closer look a strings with grep shows flag

# Walkthrough

```c
strings ./slap.jpg | grep strings
```
<details>
	<summary>Flag</summary>

![Flag](images/flag.png)
</details>