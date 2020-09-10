Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147D0264438
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Sep 2020 12:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgIJKfV (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 10 Sep 2020 06:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgIJKen (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Sep 2020 06:34:43 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E9DC061756;
        Thu, 10 Sep 2020 03:34:42 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id a3so5456799oib.4;
        Thu, 10 Sep 2020 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U/FHyz5VvXMhFuLy4pTytVx64fYdV4VQb0OoEfnTzMg=;
        b=DXIdhgjSwiN1W9/1bSxvPaMGLHl5hKebA89iWDNOtzIKMdVvToXVAMki9j72sA22Ci
         aOWO5juimn5PLKiqP8q4ivRob1vhSKoYTeSBCddqpZT3a0dDFXLbuCk28Svm2TJseLi9
         8ivEBQwoPMummYBTQKeoEmISUFy75HwZdc1/96S0kAqm14grvfPbCShGC0ss13n249fc
         iQs2jzUMcnW6Yinkdw5x4qN8FpRclq/Shrf6DfSYPsBu/GksdUzdxmogExiG6rwQ5Yzq
         kzHVzpKPJXikSUGKeAWjHy8h4sbzekGqq13ZtR0t2SCx1alogGUpaYV5nileQI4KJdso
         KrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=U/FHyz5VvXMhFuLy4pTytVx64fYdV4VQb0OoEfnTzMg=;
        b=mt+uApTll+yoHSkTh0B74wSpmR3kNJsjEqVlwwuuNVHH1sPmYh8ixsmMkU22Wbi5rM
         ttI5+eUnoPILDXOjlZsNGOyzFNUyOVN9PV5EZnqfwvpz7oOWDfrYC76F4vGKtRX7HZ+t
         G899PcUGUX5isTGMyNe94eOc7N4JiunsRa0EGkLZ1qUUQkeQjYRn2ZcuTA0Mv8INsDWn
         KsoNsJpSeDpl4tVStoV9GEjzBzMl2FtJNyFfCS8MhZ7KyBcRqB2uO3O/W/neRwpk6GL3
         J3oOl7xDfo8nA3gh1+Zlf+vZNM9uHB+MZJnc+lnYZ+1tssBWdRFGYeRMY+HZnpP9/7Gm
         z+PQ==
X-Gm-Message-State: AOAM5310CuRQVFnDONi3dDC9fyrLlPnhk1Vx0FsxBuajc80Lwwf4+E/w
        X88q4GPg1e6+984F+ENCXaR05FwcfNQ=
X-Google-Smtp-Source: ABdhPJw81wYw0Eipp6de+IVahRV824IXUkv31huSRrnMnIyL0zajjhfsCReCQjbMinxYfmLa6QvmIQ==
X-Received: by 2002:aca:f05:: with SMTP id 5mr3096009oip.173.1599734081865;
        Thu, 10 Sep 2020 03:34:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d63sm853119oig.53.2020.09.10.03.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 03:34:41 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus) Expose PEC debugfs attribute
To:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org, jdelvare@suse.com,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20200910100516.GE12635@kadam>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <92b193b6-7912-1823-ca38-58cf208e68c4@roeck-us.net>
Date:   Thu, 10 Sep 2020 03:34:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910100516.GE12635@kadam>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/10/20 3:05 AM, Dan Carpenter wrote:
> Hi Andrew,
> 
> url:    https://github.com/0day-ci/linux/commits/Andrew-Jeffery/hwmon-pmbus-Expose-PEC-debugfs-attribute/20200910-010642
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: x86_64-randconfig-m001-20200909 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/hwmon/pmbus/pmbus_core.c:2415 pmbus_debugfs_ops_pec_open() warn: '0x' prefix is confusing together with '%1llu' specifier
> 
> # https://github.com/0day-ci/linux/commit/705b8b5588d4102256d0954086ed16c9bdf9804f
> git remote add linux-review https://github.com/0day-ci/linux
> git fetch --no-tags linux-review Andrew-Jeffery/hwmon-pmbus-Expose-PEC-debugfs-attribute/20200910-010642
> git checkout 705b8b5588d4102256d0954086ed16c9bdf9804f
> vim +2415 drivers/hwmon/pmbus/pmbus_core.c
> 
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2391  static int pmbus_debugfs_set_pec(void *data, u64 val)
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2392  {
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2393  	int rc;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2394  	struct i2c_client *client = data;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2395  
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2396  	if (!val) {
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2397  		client->flags &= ~I2C_CLIENT_PEC;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2398  		return 0;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2399  	}
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2400  
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2401  	if (val != 1)
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2402  		return -EINVAL;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2403  
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2404  	rc = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2405  	if (rc < 0)
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2406  		return rc;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2407  
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2408  	if (!(rc & PB_CAPABILITY_ERROR_CHECK))
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2409  		return -ENOTSUPP;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2410  
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2411  	client->flags |= I2C_CLIENT_PEC;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2412  
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2413  	return 0;
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2414  }
> 705b8b5588d410 Andrew Jeffery 2020-09-09 @2415  DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_pec, pmbus_debugfs_get_pec,
> 705b8b5588d410 Andrew Jeffery 2020-09-09  2416  			 pmbus_debugfs_set_pec, "0x%1llu\n");
>                                                                                                  ^^^^^^^
> Was the 1 intentional?  Anyway, you probably want to remove the 0x so
> it doesn't look like hex.
> 

Nice catch; I didn't notice the 1. It is still there in v2, but it does seem quite useless.

Guenter

> 705b8b5588d410 Andrew Jeffery 2020-09-09  2417  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

