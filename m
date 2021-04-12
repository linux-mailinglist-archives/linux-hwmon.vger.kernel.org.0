Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBE735C90B
	for <lists+linux-hwmon@lfdr.de>; Mon, 12 Apr 2021 16:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240199AbhDLOlf (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 12 Apr 2021 10:41:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:56544 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237806AbhDLOlf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Apr 2021 10:41:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BD856B1BC;
        Mon, 12 Apr 2021 14:41:16 +0000 (UTC)
Date:   Mon, 12 Apr 2021 16:41:15 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add keyword pattern for hwmon registration
 functions
Message-ID: <20210412164115.0ff0a63a@endymion>
In-Reply-To: <20210410063625.139687-1-linux@roeck-us.net>
References: <20210410063625.139687-1-linux@roeck-us.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri,  9 Apr 2021 23:36:25 -0700, Guenter Roeck wrote:
> A pattern match for hardware monitoring registration functions ensures
> that hardware monitoring maintainers are copied whenever hardware
> monitoring drivers are added to the tree.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8f9fc5eaf08..f7513d8be996 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7851,6 +7851,7 @@ F:	Documentation/hwmon/
>  F:	drivers/hwmon/
>  F:	include/linux/hwmon*.h
>  F:	include/trace/events/hwmon*.h
> +K:	(devm_)?hwmon_device_(un)?register(|_with_groups|_with_info)
>  
>  HARDWARE RANDOM NUMBER GENERATOR CORE
>  M:	Matt Mackall <mpm@selenic.com>

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
