SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);

void setupSoundInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
