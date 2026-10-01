package org.androidaudioplugin.ports.juce.ysfx

import android.content.Context
import androidx.annotation.RequiresApi
import org.androidaudioplugin.PluginInformation
import org.androidaudioplugin.hosting.AudioPluginHostHelper
import org.androidaudioplugin.midideviceservice.AudioPluginMidiDeviceService
import org.androidaudioplugin.midideviceservice.AudioPluginMidiUmpDeviceService

// Each plugin is exposed as a MIDI device of its own, as it was when they were in separate apps.
// (StandaloneAudioPluginMidiDeviceService would expose all the plugins in this package through one
// device, where it maps a port to a plugin by matching the device name and port name to the plugin name.)

private const val FX_ID = "juceaap:ysfx-s-fx"
private const val INSTRUMENT_ID = "juceaap:ysfx-s-instrument"

private fun getLocalPlugin(context: Context, pluginId: String): List<PluginInformation> =
    AudioPluginHostHelper.queryAudioPluginServices(context, context.packageName)
        .flatMap { it.plugins }.filter { it.pluginId == pluginId }

class FxMidiDeviceService : AudioPluginMidiDeviceService() {
    override val plugins get() = getLocalPlugin(applicationContext, FX_ID)
}

class InstrumentMidiDeviceService : AudioPluginMidiDeviceService() {
    override val plugins get() = getLocalPlugin(applicationContext, INSTRUMENT_ID)
}

@RequiresApi(35)
class FxMidiUmpDeviceService : AudioPluginMidiUmpDeviceService() {
    override val plugins get() = getLocalPlugin(applicationContext, FX_ID)
}

@RequiresApi(35)
class InstrumentMidiUmpDeviceService : AudioPluginMidiUmpDeviceService() {
    override val plugins get() = getLocalPlugin(applicationContext, INSTRUMENT_ID)
}
