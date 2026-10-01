# aap-juce-ysfx

It is a port of [JoepVanlier/ysfx](https://github.com/JoepVanlier/ysfx) to [AAP (Audio Plugins For Android)](https://github.com/atsushieno/aap-core) using [aap-juce](https://github.com/atsushieno/aap-juce).


This app contains two plugins: ysfx-s FX and ysfx-s Instrument. Both are in
one app package, hosted by one AudioPluginService in one process, and each
plugin library has its own JUCE runtime. It requires some tweaks to the usual
aap-juce app setup (e.g. we do not compile the JUCE Java sources); see "More
Than One JUCE Plugin Library in an App" in aap-juce `docs/JUCE_GUI_SUPPORT.md`.
Each plugin is exposed as its own MIDI device (see `MidiDeviceServices.kt`).
