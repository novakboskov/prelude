;;; prelude-more-verilog.el --- Verilators verilog-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Novak Boškov

;; Author: Novak Boškov <gnovak.boskov@gmail.com>
;; Keywords: verilog

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This is how I load the latest Verilator's verilog-mode

;;; Code:

(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode))

;; This workaround is necessary as a dirty fix
;; https://github.com/flycheck/flycheck/issues/740
(setq flycheck-verilog-verilator-executable "invoke-verilator.sh")

(provide 'prelude-more-verilog)
;;; prelude-more-verilog.el ends here
