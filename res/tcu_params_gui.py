# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'tcu_params_gui.ui'
#
# Created by: PyQt5 UI code generator 5.10.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 579)
        MainWindow.setAutoFillBackground(False)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.gridLayout = QtWidgets.QGridLayout(self.centralwidget)
        self.gridLayout.setObjectName("gridLayout")
        self.text_info = QtWidgets.QTextBrowser(self.centralwidget)
        font = QtGui.QFont()
        font.setFamily("Courier 10 Pitch")
        self.text_info.setFont(font)
        self.text_info.setObjectName("text_info")
        self.gridLayout.addWidget(self.text_info, 0, 0, 1, 1)
        self.groupBox_2 = QtWidgets.QGroupBox(self.centralwidget)
        self.groupBox_2.setObjectName("groupBox_2")
        self.formLayout_2 = QtWidgets.QFormLayout(self.groupBox_2)
        self.formLayout_2.setObjectName("formLayout_2")
        self.label_6 = QtWidgets.QLabel(self.groupBox_2)
        self.label_6.setObjectName("label_6")
        self.formLayout_2.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.label_6)
        self.spin_num_pulses = QtWidgets.QSpinBox(self.groupBox_2)
        self.spin_num_pulses.setMinimum(1)
        self.spin_num_pulses.setMaximum(32)
        self.spin_num_pulses.setObjectName("spin_num_pulses")
        self.formLayout_2.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.spin_num_pulses)
        self.label_7 = QtWidgets.QLabel(self.groupBox_2)
        self.label_7.setObjectName("label_7")
        self.formLayout_2.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.label_7)
        self.spin_num_repeats = QtWidgets.QSpinBox(self.groupBox_2)
        self.spin_num_repeats.setMinimum(1)
        self.spin_num_repeats.setMaximum(999999999)
        self.spin_num_repeats.setDisplayIntegerBase(10)
        self.spin_num_repeats.setObjectName("spin_num_repeats")
        self.formLayout_2.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.spin_num_repeats)
        self.label_10 = QtWidgets.QLabel(self.groupBox_2)
        self.label_10.setObjectName("label_10")
        self.formLayout_2.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.label_10)
        self.spin_duty_cycle = QtWidgets.QSpinBox(self.groupBox_2)
        self.spin_duty_cycle.setMaximum(100)
        self.spin_duty_cycle.setProperty("value", 50)
        self.spin_duty_cycle.setDisplayIntegerBase(10)
        self.spin_duty_cycle.setObjectName("spin_duty_cycle")
        self.formLayout_2.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.spin_duty_cycle)
        self.label_8 = QtWidgets.QLabel(self.groupBox_2)
        self.label_8.setObjectName("label_8")
        self.formLayout_2.setWidget(5, QtWidgets.QFormLayout.LabelRole, self.label_8)
        self.spin_x_amp_delay = QtWidgets.QDoubleSpinBox(self.groupBox_2)
        self.spin_x_amp_delay.setSingleStep(0.1)
        self.spin_x_amp_delay.setProperty("value", 3.5)
        self.spin_x_amp_delay.setObjectName("spin_x_amp_delay")
        self.formLayout_2.setWidget(5, QtWidgets.QFormLayout.FieldRole, self.spin_x_amp_delay)
        self.label_9 = QtWidgets.QLabel(self.groupBox_2)
        self.label_9.setObjectName("label_9")
        self.formLayout_2.setWidget(6, QtWidgets.QFormLayout.LabelRole, self.label_9)
        self.spin_l_amp_delay = QtWidgets.QDoubleSpinBox(self.groupBox_2)
        self.spin_l_amp_delay.setSingleStep(0.1)
        self.spin_l_amp_delay.setProperty("value", 1.0)
        self.spin_l_amp_delay.setObjectName("spin_l_amp_delay")
        self.formLayout_2.setWidget(6, QtWidgets.QFormLayout.FieldRole, self.spin_l_amp_delay)
        self.sping_prepulse = QtWidgets.QDoubleSpinBox(self.groupBox_2)
        self.sping_prepulse.setSingleStep(0.1)
        self.sping_prepulse.setProperty("value", 30.0)
        self.sping_prepulse.setObjectName("sping_prepulse")
        self.formLayout_2.setWidget(4, QtWidgets.QFormLayout.FieldRole, self.sping_prepulse)
        self.label = QtWidgets.QLabel(self.groupBox_2)
        self.label.setObjectName("label")
        self.formLayout_2.setWidget(4, QtWidgets.QFormLayout.LabelRole, self.label)
        self.gridLayout.addWidget(self.groupBox_2, 0, 1, 1, 1)
        self.table_pulse_params = QtWidgets.QTableWidget(self.centralwidget)
        self.table_pulse_params.setAutoScroll(True)
        self.table_pulse_params.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectItems)
        self.table_pulse_params.setObjectName("table_pulse_params")
        self.table_pulse_params.setColumnCount(4)
        self.table_pulse_params.setRowCount(0)
        item = QtWidgets.QTableWidgetItem()
        self.table_pulse_params.setHorizontalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        self.table_pulse_params.setHorizontalHeaderItem(1, item)
        item = QtWidgets.QTableWidgetItem()
        self.table_pulse_params.setHorizontalHeaderItem(2, item)
        item = QtWidgets.QTableWidgetItem()
        self.table_pulse_params.setHorizontalHeaderItem(3, item)
        self.table_pulse_params.horizontalHeader().setDefaultSectionSize(97)
        self.gridLayout.addWidget(self.table_pulse_params, 1, 0, 1, 1)
        self.frame = QtWidgets.QFrame(self.centralwidget)
        self.frame.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.frame.setFrameShadow(QtWidgets.QFrame.Raised)
        self.frame.setObjectName("frame")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.frame)
        self.horizontalLayout.setObjectName("horizontalLayout")
        spacerItem = QtWidgets.QSpacerItem(118, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.button_export = QtWidgets.QPushButton(self.frame)
        self.button_export.setObjectName("button_export")
        self.horizontalLayout.addWidget(self.button_export)
        self.gridLayout.addWidget(self.frame, 2, 1, 1, 1)
        self.groupBox = QtWidgets.QGroupBox(self.centralwidget)
        self.groupBox.setObjectName("groupBox")
        self.formLayout = QtWidgets.QFormLayout(self.groupBox)
        self.formLayout.setObjectName("formLayout")
        self.label_2 = QtWidgets.QLabel(self.groupBox)
        self.label_2.setObjectName("label_2")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.label_2)
        self.spin_pulse_width = QtWidgets.QDoubleSpinBox(self.groupBox)
        self.spin_pulse_width.setSingleStep(0.1)
        self.spin_pulse_width.setProperty("value", 10.0)
        self.spin_pulse_width.setObjectName("spin_pulse_width")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.spin_pulse_width)
        self.label_3 = QtWidgets.QLabel(self.groupBox)
        self.label_3.setObjectName("label_3")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.label_3)
        self.spin_pri = QtWidgets.QDoubleSpinBox(self.groupBox)
        self.spin_pri.setMaximum(99999.99)
        self.spin_pri.setSingleStep(0.1)
        self.spin_pri.setProperty("value", 1000.0)
        self.spin_pri.setObjectName("spin_pri")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.spin_pri)
        self.label_5 = QtWidgets.QLabel(self.groupBox)
        self.label_5.setObjectName("label_5")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.label_5)
        self.combo_mode = QtWidgets.QComboBox(self.groupBox)
        self.combo_mode.setObjectName("combo_mode")
        self.combo_mode.addItem("")
        self.combo_mode.addItem("")
        self.combo_mode.addItem("")
        self.combo_mode.addItem("")
        self.combo_mode.addItem("")
        self.combo_mode.addItem("")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.combo_mode)
        self.label_4 = QtWidgets.QLabel(self.groupBox)
        self.label_4.setObjectName("label_4")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.LabelRole, self.label_4)
        self.spin_frequency = QtWidgets.QDoubleSpinBox(self.groupBox)
        self.spin_frequency.setDecimals(0)
        self.spin_frequency.setMaximum(10000.0)
        self.spin_frequency.setSingleStep(1.0)
        self.spin_frequency.setProperty("value", 1300.0)
        self.spin_frequency.setObjectName("spin_frequency")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.FieldRole, self.spin_frequency)
        self.widget = QtWidgets.QWidget(self.groupBox)
        self.widget.setObjectName("widget")
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout(self.widget)
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.button_remove_pulse = QtWidgets.QPushButton(self.widget)
        self.button_remove_pulse.setEnabled(False)
        self.button_remove_pulse.setObjectName("button_remove_pulse")
        self.horizontalLayout_2.addWidget(self.button_remove_pulse)
        self.button_add_pulse = QtWidgets.QPushButton(self.widget)
        self.button_add_pulse.setObjectName("button_add_pulse")
        self.horizontalLayout_2.addWidget(self.button_add_pulse)
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.FieldRole, self.widget)
        self.gridLayout.addWidget(self.groupBox, 1, 1, 1, 1)
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 27))
        self.menubar.setObjectName("menubar")
        self.menuFile = QtWidgets.QMenu(self.menubar)
        self.menuFile.setObjectName("menuFile")
        self.menuHelp = QtWidgets.QMenu(self.menubar)
        self.menuHelp.setObjectName("menuHelp")
        self.menuSettings = QtWidgets.QMenu(self.menubar)
        self.menuSettings.setObjectName("menuSettings")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.actionOpen = QtWidgets.QAction(MainWindow)
        self.actionOpen.setObjectName("actionOpen")
        self.actionQuit = QtWidgets.QAction(MainWindow)
        self.actionQuit.setObjectName("actionQuit")
        self.actionNew = QtWidgets.QAction(MainWindow)
        self.actionNew.setObjectName("actionNew")
        self.actionExport = QtWidgets.QAction(MainWindow)
        self.actionExport.setObjectName("actionExport")
        self.actionAbout = QtWidgets.QAction(MainWindow)
        self.actionAbout.setObjectName("actionAbout")
        self.actionPreferences = QtWidgets.QAction(MainWindow)
        self.actionPreferences.setEnabled(True)
        self.actionPreferences.setObjectName("actionPreferences")
        self.menuFile.addAction(self.actionNew)
        self.menuFile.addAction(self.actionOpen)
        self.menuFile.addSeparator()
        self.menuFile.addAction(self.actionExport)
        self.menuFile.addSeparator()
        self.menuFile.addAction(self.actionQuit)
        self.menuHelp.addAction(self.actionAbout)
        self.menuSettings.addAction(self.actionPreferences)
        self.menubar.addAction(self.menuFile.menuAction())
        self.menubar.addAction(self.menuSettings.menuAction())
        self.menubar.addAction(self.menuHelp.menuAction())

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "TCU Parameter Editor"))
        self.text_info.setHtml(_translate("MainWindow", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'Courier 10 Pitch\'; font-size:9pt; font-weight:400; font-style:normal;\">\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:20pt; font-weight:600;\">PRI</span></p>\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:20pt; font-weight:600;\"><br /></p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Time between adjacent pulses.</p>\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:20pt; font-weight:600;\"><br /></p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">+---------------------------------------------+</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">|                                             |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">|         +   PRI_0   +  PRI_1  +             |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">|         +&lt;---------&gt;-&lt;-------&gt;+             |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">|         +           +         +             |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">|                                             |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">|         +----+      +----+    +----+        |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">|         |    |      |    |    |    |        |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">| +-------+ P0 +------+ P1 +----+ P2 +------+ |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">|                                             |</p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">+---------------------------------------------+</p>\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>"))
        self.groupBox_2.setTitle(_translate("MainWindow", "General Parameters"))
        self.label_6.setText(_translate("MainWindow", "Number of pulses"))
        self.label_7.setText(_translate("MainWindow", "Number of repeats"))
        self.label_10.setText(_translate("MainWindow", "PRI duty cycle [%]"))
        self.label_8.setText(_translate("MainWindow", "X amp delay [μs]"))
        self.label_9.setText(_translate("MainWindow", "L amp delay [μs]"))
        self.label.setText(_translate("MainWindow", "Prepulse  [μs]"))
        item = self.table_pulse_params.horizontalHeaderItem(0)
        item.setText(_translate("MainWindow", "Pulse width"))
        item = self.table_pulse_params.horizontalHeaderItem(1)
        item.setText(_translate("MainWindow", "PRI"))
        item = self.table_pulse_params.horizontalHeaderItem(2)
        item.setText(_translate("MainWindow", "Mode"))
        item = self.table_pulse_params.horizontalHeaderItem(3)
        item.setText(_translate("MainWindow", "Frequency"))
        self.button_export.setText(_translate("MainWindow", "Export"))
        self.groupBox.setTitle(_translate("MainWindow", "Pulse Parameters"))
        self.label_2.setText(_translate("MainWindow", "Pulse width [μs]"))
        self.label_3.setText(_translate("MainWindow", "PRI [μs]"))
        self.label_5.setText(_translate("MainWindow", "Pol. Mode"))
        self.combo_mode.setItemText(0, _translate("MainWindow", "0: L-VV"))
        self.combo_mode.setItemText(1, _translate("MainWindow", "1: L-VH"))
        self.combo_mode.setItemText(2, _translate("MainWindow", "2: L-HV"))
        self.combo_mode.setItemText(3, _translate("MainWindow", "3: L-HH"))
        self.combo_mode.setItemText(4, _translate("MainWindow", "4: X-HV/H"))
        self.combo_mode.setItemText(5, _translate("MainWindow", "5: X-VV/H"))
        self.label_4.setText(_translate("MainWindow", "Frequency [MHz]"))
        self.button_remove_pulse.setText(_translate("MainWindow", "Remove"))
        self.button_add_pulse.setText(_translate("MainWindow", "Add"))
        self.menuFile.setTitle(_translate("MainWindow", "File"))
        self.menuHelp.setTitle(_translate("MainWindow", "Help"))
        self.menuSettings.setTitle(_translate("MainWindow", "Settings"))
        self.actionOpen.setText(_translate("MainWindow", "Open..."))
        self.actionQuit.setText(_translate("MainWindow", "Quit"))
        self.actionNew.setText(_translate("MainWindow", "New"))
        self.actionExport.setText(_translate("MainWindow", "Export..."))
        self.actionAbout.setText(_translate("MainWindow", "About"))
        self.actionPreferences.setText(_translate("MainWindow", "Preferences..."))

