Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E11536579E
	for <lists+linux-hwmon@lfdr.de>; Tue, 20 Apr 2021 13:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhDTLgA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 20 Apr 2021 07:36:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:55408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230290AbhDTLf7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Apr 2021 07:35:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C285D61354;
        Tue, 20 Apr 2021 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618918528;
        bh=LpsRxlZsny9TaXQpyCy9pwBQyrRKZ3OPTvlseNIXZ5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OVP3l1u2IbGMaJAwJKHQTFR+M1LWF8TVdS/Dw0bsTkHfqOsf6mLWhvHrSXXjUUwne
         oZg5+s651zj72Pr49qVPa3pgfv7Yzppa8XYsAWDI1T1rZ2OpjjTsrR/Bz13hBIFYKD
         C4OXyKxNxF7WXKiPSB5dDLp39f0DcvTQ57r9qLFw=
Date:   Tue, 20 Apr 2021 13:35:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH] hwmon: Remove amd_energy driver
Message-ID: <YH68fQZsp2/sZ85z@kroah.com>
References: <20210420112011.158160-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420112011.158160-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 20, 2021 at 04:20:11AM -0700, Guenter Roeck wrote:
> Commit 60268b0e8258 ("hwmon: (amd_energy) modify the visibility of
> the counters") restricted visibility of AMD energy counters to work
> around a side-channel attack using energy data to determine which
> instructions are executed. The attack is described in 'PLATYPUS:
> Software-based Power Side-Channel Attacks on x86'. It relies on quick
> and accurate energy readings.
> 
> This change made the counters provided by the amd_energy driver
> effectively unusable for non-provileged users. However, unprivileged
> read access is the whole point of hardware monitoring attributes.
> 
> An attempt to remedy the situation by limiting and randomizing access
> to chip registers was rejected by AMD. Since the driver is for all
> practical purposes unusable, remove it.
> 
> Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Note:
>     This submission supersedes the set of patches which was
>     limiting and randomizing RAPL register access.

Sad, maybe AMD will fix their hardware someday :(

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
