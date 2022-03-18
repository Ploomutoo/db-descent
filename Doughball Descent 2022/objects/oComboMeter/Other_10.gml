/// @description Increment Combo

audio_sound_pitch(sndComboUp,1+combo/10)

if(combo<10) combo++
image_index = combo-1

alarm[0] = timeOut
audio_stop_sound(sndComboUp)
audio_play_sound(sndComboUp,0,0)
