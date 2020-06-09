Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BE81F3A15
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2020 13:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgFILtv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 9 Jun 2020 07:49:51 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:52164 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgFILtv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jun 2020 07:49:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 50CF18030807;
        Tue,  9 Jun 2020 11:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0X3lc305CmC3; Tue,  9 Jun 2020 14:49:42 +0300 (MSK)
Date:   Tue, 9 Jun 2020 14:49:41 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (bt1-pvt) Mark is_visible functions static
Message-ID: <20200609114941.cy5rrkwasdgh5rgg@mobilestation>
References: <20200608142426.46955-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200608142426.46955-1-linux@roeck-us.net>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 08, 2020 at 07:24:26AM -0700, Guenter Roeck wrote:
> 0-day reports:
> 
> drivers/hwmon/bt1-pvt.c:303:16: warning:
> 	no previous declaration for 'pvt_limit_is_visible'
> drivers/hwmon/bt1-pvt.c:308:16: warning:
> 	no previous declaration for 'pvt_alarm_is_visible'
> 
> Declare both functions static.

Seems reasonable. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 87976ce2825d("hwmon: Add Baikal-T1 PVT sensor driver")
> Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/bt1-pvt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
> index 8709b3f54086..94698cae0497 100644
> --- a/drivers/hwmon/bt1-pvt.c
> +++ b/drivers/hwmon/bt1-pvt.c
> @@ -300,12 +300,12 @@ static irqreturn_t pvt_soft_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
> +static inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
>  {
>  	return 0644;
>  }
>  
> -inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
> +static inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
>  {
>  	return 0444;
>  }
> @@ -462,12 +462,12 @@ static irqreturn_t pvt_hard_isr(int irq, void *data)
>  
>  #define pvt_soft_isr NULL
>  
> -inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
> +static inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
>  {
>  	return 0;
>  }
>  
> -inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
> +static inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
>  {
>  	return 0;
>  }
> -- 
> 2.17.1
> 
