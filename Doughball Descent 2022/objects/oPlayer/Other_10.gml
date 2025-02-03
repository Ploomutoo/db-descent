/// @description Increment Combo
if(!canCombo) exit;

audio_sound_pitch(sndComboUp,1+combo/10)

if(combo<10) combo++

alarm[1] = comboTime
audio_stop_sound(sndComboUp)
audio_play_sound(sndComboUp,0,0)