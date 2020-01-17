Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4E01414FA
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Jan 2020 00:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbgAQX62 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 17 Jan 2020 18:58:28 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:60142 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729798AbgAQX62 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Jan 2020 18:58:28 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00HNr4sS023445;
        Fri, 17 Jan 2020 23:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=HUe2Mv1+gzzHZMCQ7wIRnL38D8FTIMoqP4MHJR9uQTs=;
 b=jxgKid6OhgatGvux+POBRsm3QPaUyQaKXEsseJPSbdo/EcN57b9ca1vFdhJIZ6h440JE
 iPCPBLg7pTZBMl7EuvVGs8o+xaB5SMg7zwSqEg55sn/9pNJKnbJJPjrCkStPOcUq+YBL
 np4BjY8RxHw8nnz9mnsQBUFzqPdOYQfGXoUpcMkps0ZEEe23hVCndsQb/SybuoAJ90ch
 NZgtcms6F2TUHfUqwvL08pr0VPPVNrf6Lc2xciUtyKhWieb49IjiGJRQgJMfMxqNVgIu
 sUlhk/QlZ79KXCt18B3vIn6ADWlcP7x7RuQ5qf3EmlludUFJ46xrrF1KSCV8xJBkgMo3 EA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2xf7403gag-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Jan 2020 23:58:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00HNrODs102099;
        Fri, 17 Jan 2020 23:56:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2xjxp619u0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Jan 2020 23:56:04 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00HNu3pI016148;
        Fri, 17 Jan 2020 23:56:03 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 17 Jan 2020 15:56:02 -0800
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (core) Do not use device managed functions for memory allocations
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200117155624.24490-1-linux@roeck-us.net>
Date:   Fri, 17 Jan 2020 18:55:59 -0500
In-Reply-To: <20200117155624.24490-1-linux@roeck-us.net> (Guenter Roeck's
        message of "Fri, 17 Jan 2020 07:56:24 -0800")
Message-ID: <yq18sm5ljsg.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9503 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001170179
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9503 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001170179
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Guenter,

> The hwmon core uses device managed functions, tied to the hwmon parent
> device, for various internal memory allocations. This is problematic
> since hwmon device lifetime does not necessarily match its parent's
> device lifetime. If there is a mismatch, memory leaks will accumulate
> until the parent device is released.
>
> Fix the problem by managing all memory allocations internally. The
> only exception is memory allocation for thermal device registration,
> which can be tied to the hwmon device, along with thermal device
> registration itself.

Great, this fixed the issue for me.

Tested-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
