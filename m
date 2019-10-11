Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 232E3D42E2
	for <lists+linux-hwmon@lfdr.de>; Fri, 11 Oct 2019 16:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbfJKOau (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 11 Oct 2019 10:30:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:38840 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728232AbfJKOau (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Oct 2019 10:30:50 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 426DA740;
        Fri, 11 Oct 2019 14:30:49 +0000 (UTC)
Date:   Fri, 11 Oct 2019 08:30:48 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 1/2] hwmon: Add support for ltc2947
Message-ID: <20191011083048.4fa39734@lwn.net>
In-Reply-To: <20191011114853.159327-1-nuno.sa@analog.com>
References: <20191011114853.159327-1-nuno.sa@analog.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 11 Oct 2019 13:48:52 +0200
Nuno Sá <nuno.sa@analog.com> wrote:

> The ltc2947 is a high precision power and energy monitor with an
> internal sense resistor supporting up to +/- 30A. Three internal no
> Latency ADCs ensure accurate measurement of voltage and current, while
> high-bandwidth analog multiplication of voltage and current provides
> accurate power measurement in a wide range of applications. Internal or
> external clocking options enable precise charge and energy measurements.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

[...]

> diff --git a/Documentation/hwmon/ltc2947.rst b/Documentation/hwmon/ltc2947.rst
> new file mode 100644
> index 000000000000..05df19775fb3
> --- /dev/null
> +++ b/Documentation/hwmon/ltc2947.rst

So this file has a .rst extension, but it's not actually a restructured
text file.  It will add a bunch of warnings during the docs build.  The
good news is that fixing it up will not be hard; see Documention/doc-guide
if need be.

Thanks,

jon
