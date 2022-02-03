#!/usr/bin/env python2
'''A reliable mail-retriever toolkit.

getmail is a reliable, modular, extensible mail retriever with support for
simple and multidrop POP3 mailboxes, multidrop SDPS mailboxes, simple and
multidrop IMAP mailboxes.  Also supports POP3- and IMAP-over-SSL, message
filtering, and other features.

getmail is Copyright (C) 1998-2019 Charles Cazabon.  All rights reserved.
Distributed under the terms of the GNU General Public License version 2 (only).
You should have received a copy of the license in the file COPYING.
'''

import sys
if sys.hexversion < 0x2030300:
    raise ImportError('getmail version 5 requires Python version 2.3.3'
                      ' or later')

__version__ = '5.16'

__all__ = [
    'baseclasses',
    'compatibility',
    'constants',
    'destinations',
    'exceptions',
    'filters',
    'imap_utf7',
    'logging',
    'message',
    'retrievers',
    'utilities',
]
