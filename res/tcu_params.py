#!/usr/bin/python3

# tcu_params.py

# TODO:
#       initialize default values from tcu_params object

import sys
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QTableWidget,QTableWidgetItem

from tcu_params_gui import Ui_MainWindow

class TCUParamsGUILogic(Ui_MainWindow):
    """docstring for TCUPulseParamsGUILogic."""
    def __init__(self, tcu_params, window):
        Ui_MainWindow.__init__(self)
        self.setupUi(window)
        self.tcu_params = tcu_params
        self.button_export.clicked.connect(self.export)
        self.button_add_pulse.clicked.connect(self.addPulse)
        self.button_remove_pulse.clicked.connect(self.removePulse)
        self.spin_num_pulses.valueChanged.connect(self.updateTable)

    def export(self):
        # retrieve general params
        self.tcu_params.num_pulses = self.spin_num_pulses.value()
        self.tcu_params.num_repeats = self.spin_num_repeats.value()
        self.tcu_params.pri_duty_cycle = self.spin_duty_cycle.value()
        self.tcu_params.prepulse = self.sping_prepulse.value()
        self.tcu_params.x_amp_delay = self.spin_x_amp_delay.value()
        self.tcu_params.l_amp_delay = self.spin_l_amp_delay.value()
        # retrieve pulse params from table
        # TODO: verify captured datatypes are ints / doubles....
        for row in range(self.table_pulse_params.rowCount()):
            pulse_width = eval(self.table_pulse_params.item(row,0).text())
            pri = eval(self.table_pulse_params.item(row,1).text())
            pol_mode = eval(self.table_pulse_params.item(row,2).text())
            frequency = eval(self.table_pulse_params.item(row,3).text())

    def addPulse(self):
        print('creating a new PulseParameters')
        pulse = PulseParameters(pulse_width = self.spin_pulse_width.value(),
                               pri = self.spin_pri.value(),
                               pol_mode = self.combo_mode.currentIndex(),
                               frequency = self.spin_frequency.value())
        self.tcu_params.params.append(pulse)
        self.updateTable()
        # if num added pulses == num_pulses, disabled add button


    def removePulse(self):
        # # get selected row, remove corresponding pulse_params from tcu_params.pulse_params list
        # self.table_pulse_params.removeRow()
        # self.tcu_params.params.pop() # TODO: getSelectedRow and delete that
        index_list = []
        for model_index in self.table_pulse_params.selectionModel().selectedRows():
            index = QtCore.QPersistentModelIndex(model_index)
            index_list.append(index)

        for index in index_list:
            print(index.row())
            del self.tcu_params.params[index.row()]
            self.table_pulse_params.removeRow(index.row())
        self.updateTable()

    def updateTable(self):
        # self.table_pulse_params.setRowCount(len(self.tcu_params.params))
        self.table_pulse_params.setRowCount(self.spin_num_pulses.value())
        for index, pulse_param in enumerate(self.tcu_params.params):
            self.table_pulse_params.setItem(index, 0, QTableWidgetItem(str(pulse_param.pulse_width)))
            self.table_pulse_params.setItem(index, 1, QTableWidgetItem(str(pulse_param.pri)))
            self.table_pulse_params.setItem(index, 2, QTableWidgetItem(str(pulse_param.pol_mode)))
            self.table_pulse_params.setItem(index, 3, QTableWidgetItem(str(pulse_param.frequency)))

        # select the last pulse
        if len(self.tcu_params.params) > 0:
            self.table_pulse_params.selectRow(len(self.tcu_params.params) -1)

        print(str(len(self.tcu_params.params)) + " vs " +  str(self.spin_num_pulses.value()))
        if  len(self.tcu_params.params) < self.spin_num_pulses.value():
            self.button_add_pulse.setEnabled(True)
        else:
            self.button_add_pulse.setEnabled(False)
        if len(self.tcu_params.params) > 0:
            self.button_remove_pulse.setEnabled(True)
        else:
            self.button_remove_pulse.setEnabled(False)

        print("setting min to : " + str(len(self.tcu_params.params)))
        self.spin_num_pulses.setMinimum(len(self.tcu_params.params))



class TCUParams(object):
    """docstring for TCUPulseParams."""
    def __init__(self, num_pulses=1, num_repeats=1, pri_duty_cycle=50, prepulse=30, x_amp_delay=3.5, l_amp_delay=1.0):
        self.num_pulses = num_pulses
        self.num_repeats = num_repeats
        self.pri_duty_cycle = pri_duty_cycle
        self.prepulse = prepulse
        self.x_amp_delay = x_amp_delay
        self.l_amp_delay = l_amp_delay
        self.params = list()

    def __str__(self):
        params = str()
        for index, pulse_param in enumerate(self.params):
            params += "\t[" + str(index) + "] " + str(pulse_param) + "\n"
        return("num_pulses : " + str(self.num_pulses) + "\n" +
               "num_repeats : " + str(self.num_repeats) + "\n" +
               "pri_duty_cycle : " + str(self.pri_duty_cycle) + "\n" +
               "prepulse : " + str(self.prepulse) + "\n" +
               "x_amp_delay : " + str(self.x_amp_delay) + "\n" +
               "l_amp_delay : " + str(self.l_amp_delay) + "\n" +
               "pulse_params : \n" + params)

    def export(self):
        """exports pulse parameters in NeXtRAD.ini format"""
        pass

class PulseParameters(object):
    """docstring for PulseParameters."""
    def __init__(self, pulse_width, pri, pol_mode, frequency):
        self.pulse_width = pulse_width
        self.pri = pri
        self.pol_mode = pol_mode
        self.frequency = frequency

    def __str__(self):
        return("pulse_width : " + str(self.pulse_width) + ", " +
               "pri : " + str(self.pri) + ", " +
               "pol_mode : " + str(self.pol_mode) + ", " +
               "frequency : " + str(self.frequency))

if __name__ == '__main__':
    tcu_params = TCUParams()

    app = QtWidgets.QApplication(sys.argv)

    window = QtWidgets.QMainWindow()

    prog = TCUParamsGUILogic(tcu_params, window)

    window.show()

    sys.exit(app.exec_())
