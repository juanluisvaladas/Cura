// Copyright (c) 2019 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.10
import QtQuick.Controls 2.3

import UM 1.3 as UM
import Cura 1.1 as Cura

import "../MachineSettings"


//
// This the content in the "Printer" tab in the Machine Settings dialog.
//
Item
{
    id: base
    UM.I18nCatalog { id: catalog; name: "cura" }

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    property int labelWidth: 130
    property int controlWidth: UM.Theme.getSize("setting_control").width * 3 / 4
    property var labelFont: UM.Theme.getFont("medium")

    property int columnWidth: (parent.width - 2 * UM.Theme.getSize("default_margin").width) / 2
    property int columnSpacing: 3
    property int propertyStoreIndex: 5  // definition_changes

    Item
    {
        id: upperBlock
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: UM.Theme.getSize("default_margin").width

        height: childrenRect.height

        // =======================================
        // Left-side column for "Printer Settings"
        // =======================================
        Column
        {
            anchors.top: parent.top
            anchors.left: parent.left
            width: base.columnWidth

            spacing: base.columnSpacing

            Label   // Title Label
            {
                text: catalog.i18nc("@title:label", "Printer Settings")
                font: UM.Theme.getFont("medium_bold")
                renderType: Text.NativeRendering
            }

            NumericTextFieldWithUnit  // "X (Width)"
            {
                id: machineXWidthField
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_width"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "X (Width)")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                unitText: catalog.i18nc("@label", "mm")
                // TODO: add forceUpdateOnChangeFunction:
            }

            NumericTextFieldWithUnit  // "Y (Depth)"
            {
                id: machineYDepthField
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_depth"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "Y (Depth)")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                unitText: catalog.i18nc("@label", "mm")
                // TODO: add forceUpdateOnChangeFunction:
            }

            NumericTextFieldWithUnit  // "Z (Height)"
            {
                id: machineZHeightField
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_height"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "Z (Height)")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                unitText: catalog.i18nc("@label", "mm")
                // TODO: add forceUpdateOnChangeFunction:
            }

            ComboBoxWithOptions  // "Build plate shape"
            {
                id: buildPlateShapeComboBox
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_shape"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "Build plate shape")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                // TODO: add forceUpdateOnChangeFunction:
            }

            SimpleCheckBox  // "Origin at center"
            {
                id: originAtCenterCheckBox
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_center_is_zero"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "Origin at center")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                // TODO: add forceUpdateOnChangeFunction:
            }

            SimpleCheckBox  // "Heated bed"
            {
                id: heatedBedCheckBox
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_heated_bed"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "Heated bed")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                // TODO: add forceUpdateOnChangeFunction:
            }

            ComboBoxWithOptions  // "G-code flavor"
            {
                id: gcodeFlavorComboBox
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_gcode_flavor"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "G-code flavor")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                // TODO: add forceUpdateOnChangeFunction:
                // TODO: add afterOnActivate: manager.updateHasMaterialsMetadata
            }
        }

        // =======================================
        // Right-side column for "Printhead Settings"
        // =======================================
        Column
        {
            anchors.top: parent.top
            anchors.right: parent.right
            width: base.columnWidth

            spacing: base.columnSpacing

            Label   // Title Label
            {
                text: catalog.i18nc("@title:label", "Printhead Settings")
                font: UM.Theme.getFont("medium_bold")
                renderType: Text.NativeRendering
            }

            PrintHeadMinMaxTextField  // "X min"
            {
                id: machineXMinField

                settingStoreIndex: propertyStoreIndex

                labelText: catalog.i18nc("@label", "X min")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                unitText: catalog.i18nc("@label", "mm")

                axisName: "x"
                axisMinOrMax: "min"

                // TODO: add forceUpdateOnChangeFunction:
            }

            PrintHeadMinMaxTextField  // "Y min"
            {
                id: machineYMinField

                settingStoreIndex: propertyStoreIndex

                labelText: catalog.i18nc("@label", "Y min")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                unitText: catalog.i18nc("@label", "mm")

                axisName: "y"
                axisMinOrMax: "min"

                // TODO: add forceUpdateOnChangeFunction:
            }

            PrintHeadMinMaxTextField  // "X max"
            {
                id: machineXMaxField

                settingStoreIndex: propertyStoreIndex

                labelText: catalog.i18nc("@label", "X max")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                unitText: catalog.i18nc("@label", "mm")

                axisName: "x"
                axisMinOrMax: "max"

                // TODO: add forceUpdateOnChangeFunction:
            }

            PrintHeadMinMaxTextField  // "Y max"
            {
                id: machineYMaxField

                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_head_with_fans_polygon"
                settingStoreIndex: propertyStoreIndex

                labelText: catalog.i18nc("@label", "Y max")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                unitText: catalog.i18nc("@label", "mm")

                axisName: "y"
                axisMinOrMax: "max"

                // TODO: add forceUpdateOnChangeFunction:
            }

            NumericTextFieldWithUnit  // "Gantry Height"
            {
                id: machineGantryHeightField
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "gantry_height"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "Gantry Height")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                unitText: catalog.i18nc("@label", "mm")
                // TODO: add forceUpdateOnChangeFunction:
            }

            ComboBoxWithOptions  // "Number of Extruders"
            {
                id: numberOfExtrudersComboBox
                containerStackId: Cura.MachineManager.activeMachineId
                settingKey: "machine_extruder_count"
                settingStoreIndex: propertyStoreIndex
                labelText: catalog.i18nc("@label", "Number of Extruders")
                labelFont: base.labelFont
                labelWidth: base.labelWidth
                controlWidth: base.controlWidth
                // TODO: add forceUpdateOnChangeFunction:
                // TODO: add afterOnActivate: manager.updateHasMaterialsMetadata

                optionModel: ListModel
                {
                    id: extruderCountModel
                    Component.onCompleted:
                    {
                        extruderCountModel.clear()
                        for (var i = 1; i <= Cura.MachineManager.activeMachine.maxExtruderCount; i++)
                        {
                            extruderCountModel.append({text: String(i), value: i})
                        }
                    }
                }
            }
        }
    }

    Item  // Start and End G-code
    {
        id: lowerBlock
        anchors.top: upperBlock.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: UM.Theme.getSize("default_margin").width

        GcodeTextArea   // "Start G-code"
        {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: UM.Theme.getSize("default_margin").height
            anchors.left: parent.left
            width: base.columnWidth - UM.Theme.getSize("default_margin").width

            labelText: catalog.i18nc("@title:label", "Start G-code")
            containerStackId: Cura.MachineManager.activeMachineId
            settingKey: "machine_start_gcode"
            settingStoreIndex: propertyStoreIndex
        }

        GcodeTextArea   // "End G-code"
        {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: UM.Theme.getSize("default_margin").height
            anchors.right: parent.right
            width: base.columnWidth - UM.Theme.getSize("default_margin").width

            labelText: catalog.i18nc("@title:label", "End G-code")
            containerStackId: Cura.MachineManager.activeMachineId
            settingKey: "machine_end_gcode"
            settingStoreIndex: propertyStoreIndex
        }
    }
}
