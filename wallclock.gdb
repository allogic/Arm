# st-util & arm-none-eabi-gdb file.elf
# target remote localhost:4242
# source script.gdb
# continue

# Print analog values
p *g_anCLDM_analog_Values@122

# Set wallclock
set *(g_anCLDM_analog_Values + 12) = 1355314332

# Print analog values
p *g_anCLDM_analog_Values@122

hbreak RTC_PrintUTCTime
commands
printf "Shadow TR:%u DR:%u\n",*0x40002800,*0x40002804
printf "Backup TR:%u DR:%u\n",*0x40002850,*0x40002854
continue
end