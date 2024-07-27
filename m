Return-Path: <linux-hwmon+bounces-3316-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D9C93DD53
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 Jul 2024 07:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0995B1F23173
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 Jul 2024 05:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FEF197;
	Sat, 27 Jul 2024 05:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFpVdpTY"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3DC14290
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 05:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722056647; cv=none; b=EAifqLo7thlPwWIEx3Ag05AoVKgmVZGanPBnnvRi+TfYqUZQaxUYY1RFHA3lV/kfre7LgV3C5T3o/GW8U81KF6oo50PrCp1gfrL1xX1WaU9m/IKime/w8QZEgGzQGi1e5IAT0d3ChilhCK1jpHEIVzz1FMo0q4bknLitZRbwGdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722056647; c=relaxed/simple;
	bh=qXqo5WvUh9i+M0wicI9XGX/4KWGmaOyKuCQBf/NrxPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIo+6tGPVZiEo7ViGU/6coiMwxs+OolAT3KJPfEAK3HAvjdOzwWsMPNAtVdz8OpewOJWmIKtSDTwXKcSXy6P4xTXVS30pXResPtLxmnf4V3e+A4mRuFxO7y8loIWAd6UzQ9oa59xYN2O0o+W6E3559WKVQlW04Xs/PmCYj4GQa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFpVdpTY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0A9C32781;
	Sat, 27 Jul 2024 05:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722056647;
	bh=qXqo5WvUh9i+M0wicI9XGX/4KWGmaOyKuCQBf/NrxPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFpVdpTYdM8FueOoUKcIC3fDNrR8XG3L8s48kKudpkRY0ChlOOnaR+279nrWNSrjk
	 TSCqWPgnZk2GUVJ4e4mtFgeWLSD5F/MJL2jJRqZXKannQk7lOoT3M2SLUjMorLEi63
	 lE2qw8M+rc8mznDAqMWP27YpNi1RnlCMX6osGjFiRY3E9yI8p+96WZVm24WPRvkH7p
	 Lf7XQyp6uFWCC5dkNdpx2Tng8vNLz9xxtpKUo2exRSrhraJSAEwtAH1iAFxgqtkQUj
	 0VTO31CEXDwaThgL7M1720qGUBoQj0s6A1WRxzzHwU7mQzXLBfd+vKlmZ+zDb/x0JV
	 SNDz5W1QHq9jg==
Date: Sat, 27 Jul 2024 13:04:03 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] hwmon: (max1668) Convert to use regmap
Message-ID: <ZqR_wzsauI5d-jUx@tzungbi-laptop>
References: <20240726221603.1190437-1-linux@roeck-us.net>
 <20240726221603.1190437-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726221603.1190437-4-linux@roeck-us.net>

On Fri, Jul 26, 2024 at 03:16:01PM -0700, Guenter Roeck wrote:
> Use regmap for caching to simplify the code and to hide read/write
> register address differences.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

