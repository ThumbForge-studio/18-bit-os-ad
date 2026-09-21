// ======================================
// Falcon OS Kernel
// Version 2.0 (Learning)
// Developer: Aarav
// ======================================

void kernel_main()
{
    // VGA Text Buffer
    char *video = (char *)0xB8000;

    // White text on black background
    char color = 0x0F;

    char message[] = "Welcome to Falcon OS Kernel!";

    int i = 0;

    while (message[i] != '\0')
    {
        video[i * 2] = message[i];     // Character
        video[i * 2 + 1] = color;      // Color
        i++;
    }

    // Never exit the kernel
    while (1)
    {
    }
}