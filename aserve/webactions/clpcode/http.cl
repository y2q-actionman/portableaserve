;; -*- mode: common-lisp; package: net.aserve -*-
;;
;; http.cl
;; clp functions named http_xxx
;;
;; copyright (c) 2003 Franz Inc, Oakland CA  - All rights reserved.
;;
;; This code is free software; you can redistribute it and/or
;; modify it under the terms of the version 2.1 of
;; the GNU Lesser General Public License as published by 
;; the Free Software Foundation, as clarified by the AllegroServe
;; prequel found in license-allegroserve.txt.
;;
;; This code is distributed in the hope that it will be useful,
;; but without any warranty; without even the implied warranty of
;; merchantability or fitness for a particular purpose.  See the GNU
;; Lesser General Public License for more details.
;;
;; Version 2.1 of the GNU Lesser General Public License is in the file 
;; license-lgpl.txt that was distributed with this file.
;; If it is not present, you can access it from
;; http://www.gnu.org/copyleft/lesser.txt (until superseded by a newer
;; version) or write to the Free Software Foundation, Inc., 59 Temple Place, 
;; Suite 330, Boston, MA  02111-1307  USA
;;
;; $Id: http.cl,v 1.1 2003/12/02 14:36:33 rudi Exp $

(in-package :net.aserve)


(def-clp-function http_header-value (req ent args body)
  (declare (ignore ent body))
  (let ((header-name (cdr (assoc "name" args :test #'equal))))
    (if* header-name
       then (let ((value 
		   (header-slot-value req
				     (read-from-string
				      (format nil ":~a"
					      (string-downcase header-name))))))
	      (html (:princ-safe value))))))


